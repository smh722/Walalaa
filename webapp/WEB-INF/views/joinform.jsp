<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>회원가입</title>

<!-- 부트스트랩 -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/basic.css" rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>

<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>

   <style>
      form.form-inline>div {
         padding: 10px 0px 10px 0px;
      }
   
      .pageset {
         width: 1080px;
         margin: 0 auto;
      }
      h1 {
         text-align: center;
      }
      label{
         width:100px; 
         text-align: right; 
         padding-right: 10px;
      }
      .loginformdiv{
         border-top: 1px solid lightgray;
         border-top-style: dotted;
      }
   </style>
</head>

<body>
      <jsp:include page="search_navbar.jsp"></jsp:include>
      
      <div class="pageset">
      <h1>회원가입</h1>
      <div class="loginformdiv" align="center">
         <form class="form-inline" name="joinform" action="joininsert.do" method="post">
            <div class="form-group">
               <label for="inputEmail" class="control-label">아이디 :</label>
               <input style="width:280px" type="email" class="form-control" name="email" id="inputEmail" placeholder="example@example.com">
            </div>
         <br>
            <div class="form-group">
               <label for="inputPassword" class="control-label joinformlist">비밀번호 :</label>
               <input style="width:280px" type="password" class="form-control" name="password" id="inputPassword" placeholder="Password">
            </div>
         <br>
            <div class="form-group">
               <label for="inputNickname" class="control-label joinformlist">닉네임 :</label>
               <input style="width:280px" type="text" class="form-control" name="nickname" id="inputNickname" placeholder="Nick-name">
            </div>
         <br>
            <div style="padding-bottom: 0px;">
               <a href="loginform.do">로그인페이지</a>   
            </div>
            <div class="form-group" align="center">   
               <button type="submit" class="btn btn-primary">회원가입</button>
            </div>   
         </form>
      </div>
   </div>
   
   