<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->


<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다aa) -->
<script type="text/javascript"   src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>

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

<title>로그인페이지</title>
</head>
<body>

   <jsp:include page="search_navbar.jsp"></jsp:include>
   
   
   <div class="pageset">
      <h1>로그인</h1>
      <div class="loginformdiv" align="center">
         <form class="form-inline" name="loginform" action="login.do" method="post">
            <div class="form-group">
               <label for="inputEmail" class="control-label">아이디:</label>
               <input style="width:280px;" type="email" class="form-control" id="inputEmail" name='email' placeholder="example@example.com">
            </div>
         <br>
            <div class="form-group">
               <label for="inputPassword" class="control-label loginformlist" >비밀번호:</label>
               <input style="width:280px;" type="password" class="form-control" id="inputPassword" name='password'placeholder="Password" >
            </div>
         <br>
            <div style="padding-bottom: 0px;">
               <a href="joinform.do">회원가입 /</a>
               <a href="findpasswordform.do">비밀번호찾기</a>
            </div>
            <div class="form-group" align="center">   
               
               <button type="submit" class="btn btn-primary">로그인</button>
            </div>   
         </form>
      </div>
   </div>

</body>
</html>