<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>방송 화면</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>제가 안했어요!! 이의제기</title>

<!-- 부트스트랩 -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>

	<style>
		body {
		   padding: 0px;
		   margin-top: 0px;
		}
		
		div.main {
		   width: 99.7%;
		   height: 100%;
		   padding: 0px;
		   margin-top: -15px;
		}
		
		table {
		   width: 100%;
		   height: 70%;
		   border-collapse: collapse;
		   border-spacing: 0px;
		   padding: 0px;
		}
		
		th, tr, td{
		   padding: 0px;
		}
		
		h4, h5{
		   float: left;
		   margin: 0px;
		}
		
		
		#broadScreen {
		   width: 80%;
		   height: 100%;;
		}
		
		#chatScreen {
		   height: 95%;
		   width: 20%;
		}
		
		#chat {
		   width: 100%;
		   height: 90%;
		   margin-top: -1px;
		   margin-left: 5px;
		}
		
		.chat_log {
		   height: 100%;
		   width: 100.7%;
		   margin-left: 1px;
		}
		
		#message {
		   width: 100%;
		   height: 100%;
		}
		
		#name {
		   width: 100%;
		   height: 100%;
		}
		
		#a_broadcast_setting{
		   position: relative;
		   top: 10px;
		}
		
		.video-container {
		   position: relative;
		   padding-bottom: 56.25%;
		   padding-top: 30px;
		   height: 0;
		   overflow: hidden;
		}
		
		.video-container iframe, .video-container object, .video-container embed
		   {
		   position: absolute;
		   top: 0;
		   left: 0;
		   width: 100%;
		   height: 100%;
		}
		
		.btn_manage {
		   float: right;
		}
		
		.col-xs-12w {
		   width: 100%;
		   height: 60px;
		}
		.col-xs-1w {
		   width: 100px;
		   height: 30px;
		}
		input.chat{
			height: 60px;
		}
		
		</style>
	<script>
		   function manage() {
		      location.href = "manage.do";
		   }
	</script>

</head>
<body>
	<header>
   		<jsp:include page="search_navbar.jsp"></jsp:include>
	</header>
	
   <div class="main sub">
      <table id="broad">
         <tr>
            <td>
               <h4><strong>&nbsp;[배틀그라운드] 솔쿼드 38킬 신기록 달성!! | 김성태 솔쿼드</strong></h4> 
               <a id="a_broadcast_setting" href="broadcast_setting.do">방송설정</a>
            </td>
            <td colspan="3">
               <h4>실시간 채팅</h4> &nbsp;
               <h5>159명 시청중</h5>
               <button type="button" class="btn btn-primary btn_manage" onclick="manage();">
                  <span class="glyphicon glyphicon-cog"></span>
               </button>
            </td>
         </tr>
         <tr>
            <td rowspan="3" id="broadScreen">
               <div class="video-container">
                  <iframe height="100%" width="100%"
                   src="https://www.youtube.com/embed/CB6gwOJp_8U" frameborder="0" allowfullscreen></iframe>
               </div>
            </td>
            <td colspan="2" id="chatScreen"><textarea id="chatLog" class="chat_log" readonly></textarea></td>
         </tr>
         <tr>
            <form id="chat">
               <td class="col-xs-1w" colspan="3"><input id="name" class="name" type="text" readonly></td>
         </tr>
         <tr>
               <td class="col-xs-12w"> <input id="message" class="message" type="text"></td>
               <td> <input type="submit" class="chat" value="chat" /></td>
            </form>
         </tr>
      </table>
   </div>




   <div id="box" class="box">
      <script src="http://192.168.1.6:82/socket.io/socket.io.js"></script>
<!--       <script src="https://code.jquery.com/jquery-1.11.1.js"></script>  없어도 될듯함-->
      <script>
         $(document).ready(
               function() {
                  var socket = io("http://192.168.1.6:82");

                  $('#chat').on(
                        'submit',
                        function(e) {
                           socket.emit('send message', $('#name')
                                 .val(), $('#message').val());
                           $('#message').val("");
                           $("#message").focus();
                           e.preventDefault();
                        });
                  socket.on('receive message', function(msg) {
                     $('#chatLog').append(msg + '\n');
                     $('#chatLog').scrollTop(
                           $('#chatLog')[0].scrollHeight);
                  });
                  socket.on('change name', function(name) {
                     $('#name').val(name);
                  });
               });
      </script>
   </div>
</body>
</html>