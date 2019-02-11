<%@page import="com.utf18.site.vo.UserVO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="ko">
<head>
<title>방송 화면</title>
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>제가 안했어요!! 이의제기</title>


<!-- 구글폰트 -->
<!-- <link href="https://fonts.googleapis.com/css?family=Hi+Melody" rel="stylesheet"> -->

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript"
   src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>

<style>
body {
   padding: 0px;
   margin-top: 0px;
}

div.main {
   width: 95%;
   height: 90%;
   padding: 0px;
   margin-top: -15px;
   margin-left: 15px;
   text-align: center;
}

table {
   width: 100%;
   height: 80%;
   border-collapse: collapse;
   border-spacing: 0px;
   margin-left: 10px;
   padding: 0px;
}

th, tr, td {
   /*          vertical-align: middle; */
   padding: 0px;
}

h4, h5 {
   float: left;
   margin: 0px;
}

#broadScreen {
   width: 80%;
   height: 90%;
}

/* 채팅로그가 뜨는 채팅 화면 */
#chatScreen {
   height: 100%;
   width: 20%;
}

#chat {
   width: 100%;
   height: 100%;
   margin-top: -1px;
}

.chat_log {
   height: 100%;
   /*          width: 100.7%; */
   width: 98%;
   margin-left: 5px;
   resize: none;
   text-align: left;
   /*    border: solid lightgray 1px; */
   padding: 10px 10px 10px 10px;
   border: 1px solid #2e9dfe;
   border-radius: 10px 10px 0 0;
}

/* 메세지 입력란 */
#message {
   /*    width: 99%; */
   /*    height: 100%; */
   /*    margin-left: 6px; */
   width: 99%;
   height: 100%;
   margin-left: 6px;
   padding: 10px 10px 10px 20px;
   border: 1px solid #2e9dfe;
   border-right: none;
   border-radius: 0 0 0 10px;
   font-size: 17px;
}

/* 전송버튼 */
#buttonMessage {
   margin: 0;
   border: none;
   padding: 0 20px;
   height: 40px;
   border-radius: 0 0 10px 0;
   font-size: 12px;
   /*    부트스트랩 기본색 #337ab7  밝은파란색 2e9dfe*/
   background:
      url(${pageContext.request.contextPath}/assets/images/send_icon.png)
      center no-repeat #2e9dfe;
   color: #fff;
   vertical-align: bottom;
}

#name {
   width: 99%;
   height: 100%;
   margin-left: 5px;
}

#subscribe_img {
   font-family: 'Hi Melody', cursive;
}

.subscribe {
   width: 30px;
   height: 30px;
   position: relative;
   float: left;
   top: 3px;
}

.btn_manage {
   float: right;
   position: relative;
}

#a_broadcast_setting {
   position: relative;
   float: left;
   top: 7px;
   /*          left: -240px; */
}

/*   방송 종료 버튼 */
.brFinish_btn {
	background: white;
	border: none;
	float: right;
}


/*   이의제기 버튼 */
#objbtn {
	background:
		url(${pageContext.request.contextPath}/assets/images/eej2.png) center
		no-repeat #fff;
	border: none;
}
/* [호버] 이의제기 버튼 */
#objbtn:hover {
	background:
		url(${pageContext.request.contextPath}/assets/images/eej2_hover.png) center
		no-repeat #fff;
	border: none;
}


/* 관리자창 버튼 */
.btn_manage {
	float: right;
	position: relative;
	height:30px;
	margin-top: 5px;
	margin-right:5px;
	background:
	url(${pageContext.request.contextPath}/assets/images/manage_btn.png) center
	no-repeat #fff;
	border: none;
}
/* [호버] 관리자창 버튼 */
.btn_manage:hover {
	float: right;
	position: relative;
	height:30px;
	margin-top: 5px;
	margin-right:5px;	
	background:
	url(${pageContext.request.contextPath}/assets/images/manage_btn_hover.gif) center
	no-repeat #fff;
	border: none;
}

.video-container {
   position: relative;
   padding-bottom: 56.25%;
   padding-top: 30px;
   height: 0;
   overflow: hidden;
   z-index: 1;
}

.video-container iframe, .video-container object, .video-container embed
   {
   position: absolute;
   top: 0;
   left: 0;
   width: 100%;
   height: 100%;
}

.col-xs-12w {
   width: 100%;
   height: 100px;
}

.col-xs-1w {
   text-align: start;
   padding-left: 5px;
   padding-top: 6px;
   /*           background-color: #ffc90e; */
   margin-left: 10px;
   width: 100px;
   height: 30px;
}

input.chat {
   height: 60px;
}
</style>

<style type="text/css">

button,
button::after {
  -webkit-transition: all 0.3s;
   -moz-transition: all 0.3s;
  -o-transition: all 0.3s;
   transition: all 0.3s;
}

</style>

<script>
	String.prototype.replaceAll = function(search, replacement) {
	    var target = this;
	    return target.replace(new RegExp(search, 'g'), replacement);
	};

   function manage() {
      window.open("about:blank").location.href = "manage.do";
   }

   function hideDiv() {
      document.getElementById("subscribe_img").style.display = "none";
   }
   self.setTimeout("hideDiv()", 3000); // 초 지정
</script>

<script type="text/javascript">
   var chatingtxt = new Array();
   var i = 0;
   var sock = null;
   var id = '${login.email}';
   $(document).ready(
         function() {
            $("#message").focus(); // 처음 접속시, 메세지 입력창에 focus 시킴

            //서버로 접속할때는 localhost로 설정해줘야됨 (관리자)
            // 본인의 서버로 접속할경우, admin으로 들어가야만 채팅이 가능하다.
            if (id == 'admin@admin.com') {
               ws = new WebSocket("ws://localhost:8181/Walalaa/echo.do");
            } else {
               // 그 외 회원은 admin을 제외한 다른 아이디로 접속 시, 채팅참여가 가능하다.
               ws = new WebSocket("ws://192.168.0.9:8181/Walalaa/echo.do");
            }

            //서버로 메세지 보낼때
            ws.onopen = function() {
               //처음 접속 시에만 채팅방에 추가함(현재 방정보도 같이 출력)      
               $("#chatLog").append("<b>채팅방에 참여했습니다.</b> : " + $("#room").val()+ "<br>");

               //보내기 버튼 눌렀을때
               $("#buttonMessage").click(function() {
                  var msg = $('input[name=chatInput]').val(); //메시지
                  var room = $("#room").val(); //방이름(전체단톡방이면 all)

                  //전체에게 보낼때
                  if (msg != "") {
                  //소켓으로 메세지 전달
                  ws.send(msg + "!%/" + ""+ "!%/" + room);
                  chatingtxt.push(msg);
                  $("#message").val(""); //입력창 내용지우기
                  $("#message").focus(); //입력창 포커스 획득
                  console.log(chatingtxt);
                  }
               });
            
               //엔터키 입력처리
               $("#message").keypress(function(event) {
                  if (event.which == "13") {
                     event.preventDefault();
   
                     var msg = $('input[name=chatInput]').val(); //메시지
                     var room = $("#room").val(); //방이름(전체단톡방이면 all)
                     //전체에게 보낼때
                     if (msg != "") {
                        //소켓으로 메세지 전달
                        ws.send(msg + "!%/"+ "" + "!%/"+ room);
                        chatingtxt.push(msg);
                        $("#message").val(""); //입력창 내용지우기
                        $("#message").focus(); //입력창 포커스 획득
                        console.log(chatingtxt);
                     }
                  }
               });

               //이의제기버트을 눌렀을때
               $("#objbtn").click(function() {
                  var room = $("#room").val(); //방이름(전체단톡방이면 all)
                  ws.send(room);
               });
            };
            
            //서버로 부터 받은 메세지 보내주기
            ws.onmessage = function(message) {
               var jsonData = JSON.parse(message.data);
               var msg = jsonData.message;
               if (jsonData.message != null) {
					if(msg.includes("B%A%D")){
						var rep = "&/%!"
						msg = msg.replaceAll("&/%!", "");
						msg = msg.replaceAll("B%A%D", "");
						console.log(msg);
						window.open("sendobj.do?msg="+msg,",이의제기하기","width=1000px, height=400px");
					}else{
              			 //메세지 
	                	if (msg.includes("#^$bad")) {
			                alert("비속어감지");
			                $("#chatLog").append("<b style='background-color:red;'>"+msg.substring(6)+"<b>"+"<br>");
			                $("#chatLog").scrollTop(99999999);
		                }else{
			                $("#chatLog").append(jsonData.message + "<br>");
			                $("#chatLog").scrollTop(99999999);
		                }
	               }
				}
            };

            //닫힐때
            ws.onclose = function(event) {};
            
            //경고횟수
            
   });
</script>

</head>
<body>
   <% UserVO login = (UserVO) session.getAttribute("login"); %>
   
   <!-- 세팅 부분 init -->
   <input type="hidden" id="userId" value="${login.email}">
   <!-- 유저아이디  -->
   <input type="hidden" id="room" value="${room}">
   <!-- 현재 유저가 접속한 방이름 -->

   <header>
      <jsp:include page="search_navbar.jsp"></jsp:include>
   </header>
	 
   <div class="main sub">
     <form id="finishform" action="broadcast_finish.do">
      <input type="hidden" id="roomNum" name="roomNum" value='${roomNum }'>
      <!-- 현재 유저가 접속한 방이름 -->
         <table id="broad">
            <tr>
               <td>
                  <h4>
                     <strong>[배틀그라운드] 솔쿼드 38킬 신기록 달성!! | 김성태 솔쿼드</strong>
                  </h4> <a id="a_broadcast_setting" href="broadcast_setting.do">&nbsp;·&nbsp;방송설정</a>
					

<!-- 방송종료버튼 -->     <button class="brFinish_btn" onclick="finish('${roomNum}');">
							<img src="${pageContext.request.contextPath}/assets/images/broadcast_finish.png" height="40px">
							<img src="${pageContext.request.contextPath}/assets/images/broadcast_finish_hover.png" height="40px">
						</button>
                  		

               </td>
               <td colspan="3" class="chatting_box_title">
                  <h4>&nbsp;실시간 채팅</h4>
                  <h5 style="margin-left: 4px;">· 159명 시청중 ·</h5> <a href="#"> 
                  <img class="subscribe" alt="구독누름(구독중)" src="${pageContext.request.contextPath}/assets/images/subscribe_on.png"></a>
                  <a href="#"> 
                  <img class="subscribe" alt="구독안누름" src="${pageContext.request.contextPath}/assets/images/subscribe_off.png"></a>
                  <button type="button" class="btn btn-primary btn_manage" onclick="manage();">
                     <span class="glyphicon glyphicon-cog"></span>
                  </button>
               </td>
            </tr>
            <tr>
               <td rowspan="3" id="broadScreen">
                  <div class="video-container">
                     <div id="subscribe_img" style="position: relative; z-index: 2; float: left; top: 0px;">
                        <img src="${pageContext.request.contextPath}/assets/images/heart_moving2.gif" alt="구독 감사"> 
                        <font color="white" size="5px" style="position: relative; z-index: 3; float: left; top: 55px; left: 20px;">
                           <strong>쏠님이 구독!</strong>
                        </font>
                     </div>
                     <!--  자동재생소스추가하려면   ?rel=0&autoplay=1 -->
                     <iframe height="100%" width="100%" src="https://www.youtube.com/embed/CB6gwOJp_8U?rel=0&autoplay=1" frameborder="0" allowfullscreen></iframe>
                  </div>
               </td>
               <td colspan="2" id="chatScreen">
                  <div id="chatLog" class="chat_log" style="overflow:auto;"></div>
               </td>
            </tr>
            <tr>
               <td class="col-xs-1w" colspan="3">
                  <input id="name" class="name" type="hidden" readonly> 
                  <img class="name" alt="유저이미지" width="28px" height="28px" src="${pageContext.request.contextPath}/assets/images/logo_profile.png">
                  <strong>막창사랑</strong> · 
                  <font color="red" size="2">
                     <input type='button' id='objbtn' value='이의있소!!!'>
                     <input type='text' id='warnCnt' value=''>
                  </font>
               </td>
            </tr>
            <tr>
               <td class="col-xs-12w">
                  <input type="text" id="message" name="chatInput" class="message" value="" maxlength="140">
               </td>
               <td>
                  <input type="button" id="buttonMessage" value="전송" class="chat btn-primary" style="height: 100px; width: 100px; border: 0px">
               </td>
            </tr>
         </table>
      </form>
   </div>
   

  
   <script>
      function finish(roomNum) {
         console.log($("[name='roomNum']").val());
         $("#finishform").submit();
      }
      
   </script>
   <script>   
      
   $(function() {
      timer = setInterval( function () {
         var id = "";
         id = $("#userId").val();
               $.ajax({
                    type : "post",
                    url : "getWarnCnt.do",
                    async: true,
                    data : id,
                    success : function(warnCnt){
                    if(warnCnt>=3){
                    	$("#warnCnt").val("경고" + warnCnt + "회 로 인해 채팅금지상태입니단");
                    	$('#message').attr('readonly',true);
                    	$('#message').attr('style','background-color:gray;'); 
                    }else{
                    	$("#warnCnt").val("경고" + warnCnt + "회");
                    }
                     },
                     error : function(XHR, status, error) {
//                         console.error(status + " : " + error);
                     }     
                  });
      }, 50000); // 1초에 한번씩 받아온다.
   });

</script>
</body>
</html>