<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<style>
   #topchat{
      width: 250px;
      display: inline-flex;
      padding-left: 150px;
      border-bottom: 1px solid black;
   }
   .msginput{
      background-color: lightgray;
      border: none;
   }
   body{
      padding: 0px;
      margin: 0px;
      width: 450px;
      
   }
</style>
</head>
<body>

   <div id='obj' style="border: 1px solid gray;">
   <label id="topchat"><b>채팅내역</b></label><label style="width: 30px; text-align: center;"><b>체크</b></label>
      <form id="objgogo" action="insertObj.do">
      
         <div id="objlist"></div>
      
         <button type="button" onclick="request()">제출</button>
      </form>
   </div>
   <script>
   var objlist = "${objlist}";
   objlist = objlist.substr(1);
   objlist = objlist.substr(0, objlist.length-1);
   var objs= objlist.split(", ");
   var str = "";   
      $(document).ready(function(){         
         for(var i = 0; i<objs.length; i++){
            var msg = objs[i].split(":");
            render(msg[1], objs[i]);
         };
         $("#objlist").append(str);
         });
      function render(msg, objectionInfo){
         str += "<div class='object'>";
         str += "<input type = 'text' class='msginput' readonly style='width: 400px; height: 30px;' value="+msg+">";
         str += "<input type = 'checkbox' name = 'objection' style='width: 30px;' value="+objectionInfo+"><br>";
         str += "</div>";
      };
   </script>

   <script>
      function request(){
         var send = confirm("이의신청 하시겠습니까?");
         if(send){   //확인 버튼 눌렀 -> YES
            $("#objgogo").submit();
            alert("신청완료");
         }
      }      
   </script>
</body>
</html>
