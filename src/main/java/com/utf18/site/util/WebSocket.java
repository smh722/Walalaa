package com.utf18.site.util;

import java.io.Console;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.utf18.site.service.ChatService;
import com.utf18.site.vo.ChatLogVO;
import com.utf18.site.vo.ChatMemberVO;
import com.utf18.site.vo.ChatVO;
import com.utf18.site.vo.UserVO;

public class WebSocket extends TextWebSocketHandler {
	// Service접근 (db 처리를 하기위해 )

	@Autowired
	ChatService chatService;

	private static final Logger logger = LoggerFactory.getLogger(WebSocket.class);

	// 서버에 연결된 사용자들을 저장하기위해 선언
	private List<WebSocketSession> sessionList = new ArrayList<>(); // 메세지를 날려주기위한 웹소켓전용 세션
	private Map<WebSocketSession, String> mapList = new HashMap<>(); // 실제session의 아이디정보, web소켓정보
	private Map<WebSocketSession, String> roomList = new HashMap<>(); // 실제 session의 아이디정보, room정보
	private Map<WebSocketSession, ArrayList<String>> badwordList = new HashMap<>(); // 실제 session의 아이디정보, room의 금지어 목록
	private Map<Integer, ArrayList<String>> chatLog = new HashMap<>(); // 방번호 , 채팅정보
	private List<String> userList = new ArrayList<>(); // 접속자 명단을 개개인별로 뿌려주기위해 선언한 일반리스트

	// 연결되었을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		logger.info("채팅방 연결 성공 ! / Run Time: " + new Date());

		// 1. 들어온 사람의 실제 로그인 아이디 정보를 가져온다.
		Map<String, Object> map = session.getAttributes();
		UserVO mem = (UserVO) map.get("login");
		String userId = mem.getEmail();
		String nickname = mem.getNickname();
		logger.info("로그인 정보 받아오기");
		logger.info(chatService.getRoomMember(new ChatMemberVO(0, userId, "", "")).toString());
		// 2. 들어온 아이디로 어느 방에 있는 지 확인한다.
		ChatMemberVO userRoom = chatService.getRoomMember(new ChatMemberVO(0, userId, "", ""));
		logger.info("방체크");
		// 3. 들어온 아이디로 찾은 방이름을 웹소켓 세션에 추가
		roomList.put(session, userRoom.getRoom());

		// 해당 방의 금지어를 웹소켓 세션에 추가
		logger.info(chatService.getFilterword(userRoom.getRoom()));
		String filterword = chatService.getFilterword(userRoom.getRoom());
		if (filterword != null) {
			ChatUtil chatUtil = new ChatUtil();
			ArrayList<String> totalfilter = new ArrayList<>();
			if (filterword.contains("badword")) {
				totalfilter.addAll(chatUtil.FilterwordSave("Badwords.csv"));
			}

			if (filterword.contains("ilbe_megal")) {
				totalfilter.addAll(chatUtil.FilterwordSave("Ilbe.csv"));
				totalfilter.addAll(chatUtil.FilterwordSave("Megal.csv"));
				totalfilter.addAll(chatUtil.FilterwordSave("Womad.csv"));
			}

			if (filterword.contains("adult")) {
				totalfilter.addAll(chatUtil.FilterwordSave("adult.csv"));
			}
			// 해당 session의 금지어 리스트을 등록
			badwordList.put(session, totalfilter);
		}
		System.out.println(userId + "님이 " + userRoom.getRoom() + " 방에 들어왔습니다.");
		logger.info("방세션등록");

		// 4. mapList(해당세션의 실제아이디 값을 저장하기위해 map으로 저장)
		mapList.put(session, userId); // 세션:key, 유저아이디:value

		// 5. map을 사용하지않아도 될경우를 위해서 session값도 넣도록함
		sessionList.add(session); // 세션의 값 넣기(session : id=0~ , url:/ 주소/ echo.do)

		logger.info("세션추가:" + session.getId() + "접속자아이디:" + mem.getEmail() + " 현재채팅접속자:" + sessionList.size() + "명");

		// 6. 입장 시 해당 방 인원 수를 증가시킨다.
		chatService.updateChatCountInc(new ChatVO(0, userRoom.getRoom(), "", 0, 0, ""));

		// 7. 모든유저들에게 서로다른 메시지를 전달하기위해 전체적으로 for문을 돌리도록한다.
		for (int i = 0; i < sessionList.size(); i++) {

			// 8. 해당 i번째 사람(sessionList.get(i) 의 방이름정보를 가져온다.
			// 웹소켓세션아이디가 저장된 sessionList를 이용해서 방정보를 가져옴
			String roomName = roomList.get(sessionList.get(i));

			// 9. 접속자가 속한 방에만 접속했음을 알린다.
			if (userRoom.getRoom().equals(roomList.get(sessionList.get(i)))) {
				sessionList.get(i).sendMessage(new TextMessage(JsonDataOpen(nickname)));
			}

			// 11. 같은 방에 있는사람에게만 접속자 리스트를 날려주도록한다.
			userList = informUser(mapList, roomName); // 현재 while문에서 사용중인 roomName값으로 리스트를 가져온다(아래method확인)
			System.out.println("현재방에 참석중인사람수:" + userList.size());
			ChatUtil chatUtil = new ChatUtil(); // util소속 클래스 선언
			String userListMessage = chatUtil.split(userList); // 받아온 list에 대해서 문자열로 바인딩해서 날려줌
			sessionList.get(i).sendMessage(new TextMessage(JsonUser(userListMessage)));

			// 12. 방리스트를 모든 사람들에게 보내줌
			String roomNames = getRoomName();
			sessionList.get(i).sendMessage(new TextMessage(JsonRoom(roomNames)));

		}

		// 13. 없는방에대해서 삭제처리를 한다.
//       chatService.deleteChat();
	}

//통신 연결끊었을때실행
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {

		// 1. 현재 접속한 사람의 로그인한 id정보를 가져온다.
		Map<String, Object> map = session.getAttributes();
		UserVO mem = (UserVO) map.get("login");
		String userId = mem.getEmail();
		// 2. 접속을끊을 때 해당 아이디로 DB에서 어느 방에 존재하는지 확인한다.
		ChatMemberVO member = chatService.getRoomMember(new ChatMemberVO(0, userId, "", ""));

		if (chatService.getChatOwner(userId) != null) {
			ChatVO info = chatService.getRoomInfo(member.getRoom());
			ArrayList<String> log = chatLog.get(info.getNum());
			for (String tmp : log) {
				String msgArr[] = new String[3];
				msgArr = tmp.split("&/%!"); // &/%!로 문자를 잘라서 배열에저장
				
					
				ChatLogVO vo = new ChatLogVO(msgArr[0], msgArr[1], info.getNum());

				chatService.addChatLog(vo);
			}
		}
		chatService.updateChatCountDec(new ChatVO(0, member.getRoom(), "", 0, 0, ""));
		chatService.deleteRoomMember(member);
		chatService.deleteChat();
		// 3. 해당유저의 roomList, mapList, sessionList를 제거한다( 미리 제거를 해야만 본인 제외한 모든사람들에게 본인의
		// 정보를 날려줄수있기때문)
		roomList.remove(session);
		mapList.remove(session); // 세션:key, 유저아이디:value
		sessionList.remove(session); // 실제 websocket 세션명
		logger.info("세션삭제:" + session.getId() + ",아이디삭제:" + userId + ",채팅 남은사람수:" + sessionList.size());

		// 4. 이전 방에서 인원수를 감소시킨다. (이전방정보로 지우기)
//       if(member.getPriroom()!=null) {
//          chatService.updateChatCountDec(new ChatVO(0, member.getPriroom(), "", 0, 0, ""));
//       }

		// 4. 본인 제외하고 본인이 있던방의 모든사람들에게 나갔음을 알림
		// 이유 : 해당 아이디가 이전의 있던 방에만 데이터를 전달할경우, 해당아이디가 없었던 방의 데이터는 전달이 안되고 아무정보도 들어오지않기때문

	}

	// 서버가 클라이언트로부터 메시지를 받았을때
	@Override // WebSocketMessage<?>
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {

		// 1. 회원정보 가져오기
		Map<String, Object> map = session.getAttributes();
		UserVO mem = (UserVO) map.get("login");
		String userId = mem.getEmail();
		logger.info("서버응답서버응답서버응답서버응답서버응답서버응답서버응답서버응답서버응답서버응답서버응답서버응답서버응답서버응답서버응답서버응답서버응답서버응답서버응답서버응답서버응답서버응답");
		if (message.getPayload().contains("!%/")) {
				
			// 2. 문자열 형태 : 문자 !%/ 대상 !%/ 방이름
			System.out.println(message.getPayload());

			// 3. 배열선언(split을 이용해서 문자열을 자른다)
			String msgArr[] = new String[3];
			msgArr = message.getPayload().split("!%/"); // %!로 문자를 잘라서 배열에저장
			String time = chatService.getTime();
	        logger.info("메시지 보낸 시간 : "  + time);
			// 4. [0]: 유저가 보낸 메시지, [1]:귓속말 대상자, [2]:방의 이름
			System.out.println("보낸메시지:" + msgArr[0] + ", 귓속말대상자:" + msgArr[1] + ", 방의이름:" + msgArr[2]);
			boolean send = true;

			// 알고리즘 여기부터 시작하시면 됩니다

			for (String badword : badwordList.get(session)) {
				if (msgArr[0].contains(badword)) {
					logger.info("비속어감지   비속어감지   비속어감지   비속어감지   비속어감지   비속어감지   비속어감지   비속어감지   비속어감지   비속어감지   ");
					session.sendMessage(new TextMessage(JsonDataBad(userId, msgArr[0])));
					send = false;
					chatService.plusWarningCount(userId);		// 비속어 사용 시, 경고 횟수 증가
					msgArr[0] += "&/%! B%A%D";
					break;
				}
			}
			if (send) {
				for (WebSocketSession webSocketSession : sessionList) {
					// 같은방일때만 보냄
					if (msgArr[2].equals(roomList.get(webSocketSession))) {
						webSocketSession.sendMessage(new TextMessage(JsonData(userId, msgArr[0])));
					}
				}
			}

			ChatVO roomNum = chatService.getRoomInfo(msgArr[2]);
//			채팅 내역을 chatlog list 에 저장하는 과정
			if (chatLog.get(roomNum.getNum()) == null) {
				// 없으면 해당 방 넘버에 list생성
				chatLog.put(roomNum.getNum(), new ArrayList<String>());
				// 생성한 리스트 가져오기
				ArrayList<String> list = chatLog.get(roomNum.getNum());
				// 리스트에 값추가
				list.add(userId + "&/%!" + msgArr[0]);
				// 리스트를 해당 방넘버에 등록
				chatLog.put(roomNum.getNum(), list);
			} else {
				// 방넘버에 리스트가 있어, 해당 리스트를 가져온다
				ArrayList<String> list = chatLog.get(roomNum.getNum());
				// 리스트에 바로 추가해
				list.add(userId + "&/%!" + msgArr[0]);
				// 추가한 리스트를 다시 방넘버에 등록
				chatLog.put(roomNum.getNum(), list);
			}
		} else {
			// 이의제기 신청 메세지
			String roomName = message.getPayload();
			ChatVO roomNum = chatService.getRoomInfo(roomName);
			if (chatLog.get(roomNum.getNum()) == null) {
				session.sendMessage(new TextMessage(JsonData(userId, "쳇로그없음")));
			} else {
				// 방넘버에 쳇로그리스트가 있어, 해당 리스트를 가져온다
				ArrayList<String> list = chatLog.get(roomNum.getNum());
			String objlist = "";
			for(String log : list) {
				if(log.contains(userId))
				if(log.contains("B%A%D")){
	//						log.replace("B%A%D", "");
	//						log.replace("&/%!", "");
					objlist+=log;
					logger.info("log : " + log);
					logger.info("objlist : " + objlist);
					logger.info("jsonObjData : " + JsonObjData(objlist));
				}
				session.sendMessage(new TextMessage(JsonObjData(objlist)));
			}
			}
		}
	}
	
	// json형태로 메세지 변환2(이의제기했을때)
	public String JsonObjData(String msg) {
		JsonObject jsonObject = Json.createObjectBuilder().add("message", msg).build();
		StringWriter write = new StringWriter();
		
		try (JsonWriter jsonWriter = Json.createWriter(write)) {
			jsonWriter.write(jsonObject);
		};
		return write.toString();
	}
	// json형태로 메세지 변환2( 채팅 쳤을때)
	public String JsonData(String id, Object msg) {
		JsonObject jsonObject = Json.createObjectBuilder().add("message", "<b>[" + id + "]</b> : " + msg).build();
		StringWriter write = new StringWriter();

		try (JsonWriter jsonWriter = Json.createWriter(write)) {
			jsonWriter.write(jsonObject);
		};
		return write.toString();
	}

	// json형태로 메세지 변환2( 접속했음을 알릴때)
	public String JsonDataOpen(String id) {
		JsonObject jsonObject = Json.createObjectBuilder()
				.add("message", "<b>[" + id + "]</b> 님이 <b style='color:blue'>접속</b>하셨습니다.</a>").build();
		StringWriter write = new StringWriter();

		try (JsonWriter jsonWriter = Json.createWriter(write)) {
			jsonWriter.write(jsonObject);
		}
		;
		return write.toString();
	}

	// json형태로 메세지 변환3( 나갔음을 알릴때)
	public String JsonDataClose(String id) {
		JsonObject jsonObject = Json.createObjectBuilder()
				.add("message", "<b>[" + id + "]</b> 님이 <b style='color:red'>퇴장</b>하셨습니다.").build();
		StringWriter write = new StringWriter();

		try (JsonWriter jsonWriter = Json.createWriter(write)) {
			jsonWriter.write(jsonObject);
		}
		;
		return write.toString();
	}

	// 욕설시
	public String JsonDataBad(String id, Object msg) {
		JsonObject jsonObject = Json.createObjectBuilder().add("message", "#^$bad" + "<b>[" + id + "]</b> : " + msg)
				.build();
		StringWriter write = new StringWriter();

		try (JsonWriter jsonWriter = Json.createWriter(write)) {
			jsonWriter.write(jsonObject);
		}

		return write.toString();
	}

	// json형태로 유저 정보 날리기
	public String JsonUser(String id) {
		JsonObject jsonObject = Json.createObjectBuilder().add("list", id).build();
		StringWriter write = new StringWriter();

		try (JsonWriter jsonWriter = Json.createWriter(write)) {
			jsonWriter.write(jsonObject);
		}
		;
		return write.toString();
	}

	// json형태로 방 정보 날리기
	public String JsonRoom(String roomNames) {
		JsonObject jsonObject = Json.createObjectBuilder().add("room", roomNames).build();
		StringWriter write = new StringWriter();

		try (JsonWriter jsonWriter = Json.createWriter(write)) {
			jsonWriter.write(jsonObject);

		}

		return write.toString();
	}

	// 유저리스트
	private List<String> informUser(Map<WebSocketSession, String> maplist, String room) throws Exception {
		// 맵을 이용해서 세션을 통해 아이디값을 value로 가져와서 list에 담기

		// 1.담을 리스트 껍데기 선언
		List<String> list = new ArrayList<>();

		// 2. 존재하는 웹소켓아이디, 로그인아이디 만큼 while문을 돌려준다.
		Iterator<WebSocketSession> sessionIds = maplist.keySet().iterator();
		while (sessionIds.hasNext()) {
			WebSocketSession sessionId = sessionIds.next();
			String value = maplist.get(sessionId); // 실제 아이디값

			// 3. 해당 번지의 key값에 해당하는 방의 이름정보를 가져옴
			String userRoom = roomList.get(sessionId);

			// 4. 지금 돌고있는 while문에서 추출한 방이름과 들어온 방의이름이 같을경우 리스트에 저장하도록한다.
			if (userRoom.equals(room)) {
				System.out.println("아이디:" + value + ", 방이름:" + userRoom);
				list.add(value);
			}
		}
		return list;
	}

	// DB로부터 존재하는 방정보 String 형태로 가져오기
	public String getRoomName() throws Exception {

		List<ChatVO> roomList = chatService.getRoomList();

		String room = sessionList.size() + "";

		for (int i = 0; i < roomList.size(); i++) {
			room += ",";
			room += roomList.get(i).getName() + "/";
			room += roomList.get(i).getRemaincount() + "/";
			room += roomList.get(i).getTotalcount() + "/";
			room += roomList.get(i).getContent() + "/";
			room += roomList.get(i).getFilterword();
		}

		// room= room.substring(0, room.length()-1); //뒤의 문자열 자르기

		// logger.info(room);

		return room;

	}

	public String getRoomName(String name) throws Exception {

		List<ChatVO> roomList = chatService.searchRoomList(name);

		String room = sessionList.size() + "";

		// 검색했는데 방이 없을 경우
		if (roomList.size() < 1) {
			room += ",방이 존재하지 않습니다./ / / /null";

		}

		// 방이 존재할경우
		else {

			for (int i = 0; i < roomList.size(); i++) {
				room += ",";
				room += roomList.get(i).getName() + "/";
				room += roomList.get(i).getRemaincount() + "/";
				room += roomList.get(i).getTotalcount() + "/";
				room += roomList.get(i).getContent() + "/";
				room += roomList.get(i).getFilterword();
			}
		}
		// room= room.substring(0, room.length()-1); //뒤의 문자열 자르기

		logger.info(room);

		return room;

	}

}