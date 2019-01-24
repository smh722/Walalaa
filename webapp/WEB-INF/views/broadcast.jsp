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

<!-- 구글폰트 -->
<link href="https://fonts.googleapis.com/css?family=Hi+Melody" rel="stylesheet">

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
      
      th, tr, td{
/*          vertical-align: middle; */
         padding: 0px;
      }
      
      h4, h5{
         float: left;
         margin: 0px;
      }
      
      #broadScreen {
         width: 80%;
         height: 90%;
      }
      
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
         margin-top: 5px;
         height: 100%;
/*          width: 100.7%; */
         width: 98%;
         margin-left: 5px;
         resize: none;
      }
      
      #message {
         width: 99%;
         height: 100%;
         margin-left: 6px;
      }
      
      #name {
         width: 99%;
         height: 100%;
         margin-left: 5px;
      }
      
      #subscribe_img{
         font-family: 'Hi Melody', cursive;
      }
      
      .subscribe{
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
            
      #a_broadcast_setting{
         position: relative;
          float: left;
         top: 7px;
/*          left: -240px; */
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
         padding-top:6px;
/*           background-color: #ffc90e; */
          margin-left:10px;
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
         
         function hideDiv (){ 
           document.getElementById("subscribe_img").style.display="none"; 
         } 
         self.setTimeout("hideDiv()",3000); // 초 지정   
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
               <h4><strong>[배틀그라운드] 솔쿼드 38킬 신기록 달성!! | 김성태 솔쿼드</strong></h4>
               <a id="a_broadcast_setting" href="broadcast_setting.do">&nbsp;·&nbsp;방송설정</a>
            </td>
            <td colspan="3" class="chatting_box_title">
               <h4>&nbsp;실시간 채팅</h4>
               <h5 style="margin-left: 4px;">· 159명 시청중 · </h5>
               <a href="#">
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
               
            <div id="subscribe_img" style="position: relative; z-index:2; float: left; top: 0px;">
               <img src="${pageContext.request.contextPath}/assets/images/heart_moving2.gif" alt="구독 감사">
               <font color="white" size="5px" 
               style="position: relative; z-index:3; float: left; top: 55px; left: 20px;"><strong>쏠님이 구독!</strong></font>
            </div>
            <!--  자동재생소스추가하려면   ?rel=0&autoplay=1 -->
                  <iframe height="100%" width="100%" src="https://www.youtube.com/embed/CB6gwOJp_8U?rel=0&autoplay=1" frameborder="0" allowfullscreen></iframe>
               </div>
            </td>
            <td colspan="2" id="chatScreen"><textarea id="chatLog" class="chat_log" readonly></textarea></td>
         </tr>
         <tr>
            <form id="chat">
               <td class="col-xs-1w" colspan="3">
   <!--           <input id="name" class="name" type="text" readonly> -->
                  <img class="name" alt="유저이미지" width="28px" height="28px" 
                  src="${pageContext.request.contextPath}/assets/images/logo_profile.png">
                  <strong>막창사랑</strong> · 
                  <font color="red" size="2">경고 1회 [비속어 감지]</font>
               </td>
         </tr>
         <tr>
               <td class="col-xs-12w"> <input id="message" class="message" type="text"></td>
               <td> <input type="submit" class="chat btn-primary" value="전송"
                style="height:100px; width:100px; border:0px"/></td>
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