<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>방송종료</title>
<!-- 부트스트랩 -->
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet">

<!-- 내 CSS -->
<link href="${pageContext.request.contextPath}/assets/css/bit.css"
	rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>

<style>
.pageset {
	width: 1080px;
	margin: 0 auto;
	display: flex;
}

.infopage {
	width: 700px;
	border-right: soild 1px black;
}

.chatpage {
	width: 300px;
	margin-left: 30px;
	clear: both;
}

.noresize {
	resize: none; /* 사용자 임의 변경 불가 */
}

.chatScreen {
	width: 100%;
	height: 60%;
}

.chat_log {
	height: 100%;
	width: 90%;
	margin-left: 5px;
}

.thumbnail_tr {
	border-bottom: 5px solid white;
}

.mod_td {
	width: 50px;
	text-align: right;
	padding-right: 0px;
}

#tagbox {
	width: 100%;
}

#save {
	height: 50px;
	width: 70px;
	margin-top: 205px;
	margin-left: 205px;
}
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/search_navbar.jsp"></jsp:include>

	<div class="pageset">
		<div class="infopage">
			<form class="form-inline" name="my_form" action="">
				<h2>영상 정보</h2>
				<table class="table">
					<tr>
						<td><label for="exampleInputName2">제목: </label></td>
						<td>배그 랭킹1위 막창사랑님의 방송>< 다 드루와~~</td>
						<td class="mod_td"><a href="">수정</a>
					</tr>

					<tr>
						<td><label for="exampleInputEmail2">설정:</label></td>
						<td>배그 랭킹1위 막창사랑이 와뜨아! 지리는 에임, 스크림 최다릴 보유!! 지금 현재 킬당 만원 미션즁</td>
						<td class="mod_td"><a href="">수정</a></td>
					</tr>

					<tr class="thumbnail_tr">
						<td><label for="exampleInputName2">썸네일: </label></td>
						<td colspan="2" class="mod_td"><a href="">수정</a></td>
					</tr>
					<tr class="thumbnail_tr">
						<td colspan="2">
							<span class="btn btn-default btn-file"></span>
							<img id="blah" src="${pageContext.request.contextPath}/assets/images/game_screen.png"
							width="100%"></td>
					</tr>

					<tr class="thumbnail_tr">
						<td><font color="gray">방송시간: </font></td>
						<td colspan="2"><font color="gray">1시간 29분 30초 </font></td>
					</tr>

					<tr class="thumbnail_tr">
						<td><font color="gray">최대화질: </font></td>
						<td colspan="2"><font color="gray">1080p </font></td>
					</tr>

					<tr>
						<td><font color="gray">누적 시청자수: </font></td>
						<td colspan="2"><font color="gray">105명 </font></td>
					</tr>

					<tr>
						<td><label for="exampleInputEmail2">태그설정:</label></td>
						<td><input id="tagbox" type="text"
							value="배그, 배틀그라운드, 막창사랑, 막사, 막창, 랭킹1위, 배그랭킹1위"></td>
						<td class="mod_td"><a href="">수정</a></td>
					</tr>

					<tr>
						<td><label for="exampleInputName2">업로드:</label></td>
						<td colspan="2">
							<fieldset id="radio_group1">
								<input type="radio" name="radio_group1">공개 <input
									type="radio" name="radio_group1">비공개 <input
									type="radio" name="radio_group1">예약
							</fieldset>
						</td>
					</tr>

					<tr>
						<td><label for="exampleInputName2">저장:</label></td>
						<td colspan="2">
							<fieldset id="radio_group2">
								<input type="radio" name="radio_group2">저장 <input
									type="radio" name="radio_group2">저장안함
							</fieldset>
						</td>
					</tr>
				</table>
		</div>

				<div class="chatpage">
					<h2>실시간 채팅 다시보기</h2>
					<div class="chatScreen">
						<textarea id="chatLog" class="chat_log noresize" readonly></textarea>
					</div>
					<div class="submit_btn">
						<input type="submit" id="save" value="확인" />
					</div>
				</div>
			</form>
	</div>
</body>
</html>