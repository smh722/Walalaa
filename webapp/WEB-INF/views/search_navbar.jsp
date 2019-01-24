<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>관리자 창</title>

<!-- 부트스트랩 -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script   src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<!-- <script type="text/javascript" src="js/bootstrap.min.js"></script> -->

   <script type="text/javascript">
      function broadcast_setting() {
         location.href = "broadcast_setting.do";
      }
   
      function broadcast_finish() {
         location.href = "broadcast_finish.do";
      }
   
      function btn_js_broadcast_finish_click() {
         /* confirm(문자열, 초기값) */
         var check = confirm("정말로 방송을 종료하시겠습니까?\n방송종료시 실시간 채팅은 비활성화됩니다");
         /* if(check == true) else false */
         if (check)
            alert("방송이 종료되었습니다");
      }
   </script>
   <style type="text/css">
      body {
         margin-top: 10px;
      }
      
      .navmenu {
         margin-top: -6px;
         width: 240px;
         
      }
      .logo{
         margin-right: 20px;
      }
      
      .topbar {
         width: 1080px;
         height: 45px;
         display: flex;
         margin: 0 auto;
      }
      
      .dropdown {
         display: inline-block;
      }
      
      ul {
         list-style: none;
      }
      hr{
         margin-top: 3px;
      }
      .scale {
         transform: scale(1);
         -webkit-transform: scale(1);
         -moz-transform: scale(1);
         -ms-transform: scale(1);
         -o-transform: scale(1);
         transition: all 0.3s ease-in-out; /* 부드러운 모션을 위해 추가*/
      }
      
      .scale:hover {
         transform: scale(1.2);
         -webkit-transform: scale(1.2);
         -moz-transform: scale(1.2);
         -ms-transform: scale(1.2);
         -o-transform: scale(1.2);
      }
      
      .img_scale { /*width:325px; height:280px;*/
         overflow: hidden
      } /* 부모를 벗어나지 않고 내부 이미지만 확대 */
      
      .userbtn {
         width: 34px;
         height: 34px;
         padding-left: 0px;
         padding-right: 0px;
         color: #4682B4;
         
      }
      
      .navbar-right {
          float: right !important;
          margin-right: -15px;
          margin-top: 2px;
      }
   </style>

</head>
<body>

   <div class="topbar">
      
      <div class="img_scale logo">
         <a href="main.do">
            <img class="scale" src="${pageContext.request.contextPath}/assets/images/logo2.png"   width="100px">
         </a>
      </div>
      
      <div class="col-xs-8 searchbar">
         <div class="input-group col-xs-12">
            <input type="text" class="search-query form-control"
               placeholder="Search" /> <span class="input-group-btn">
               <button class="btn btn-primary" type="button">
                  <span class=" glyphicon glyphicon-search"></span>
               </button>
            </span>
         </div>
      </div>
      
      <div class="navmenu">
         <form class="navbar-form navbar-right">
            <div class="dropdown">
               <button class="btn dropdown-toggle userbtn btn-group" type="button" data-toggle="dropdown" style="padding-left: 1px; padding-right: 1px;">
                  <img alt="유저이미지" src="${pageContext.request.contextPath}/assets/images/user.png" width="30px">
                  </button>
                  <ul class="dropdown-menu" style="left: 0;">
                     <li><a href="mychannel.do">내 채널</a></li>
                     <li><a href="#">마이페이지</a></li>
                     <li><a href="#">로그아웃</a></li>
                  </ul>
            </div>
            <a href="broadcast_finish.do">
               <img src="https://img.icons8.com/material/50/000000/no-video.png" width="41px">
            </a>

            <a href="broadcast_setting.do">
               <img src="https://img.icons8.com/material/50/000000/video-call.png" width="41px">
            </a>
            <a class=login href="loginform.do">로그인</a>
         </form>
      </div>
   </div>

<hr>

</body>
</html>