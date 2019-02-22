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
</head>
<body>
	<div id='obj' style="border: 1px solid gray;">
			<form id="objgogo" action="insertObj.do">
		<c:forEach var="arr" items="${objlist}">
		${arr} <input type="checkbox" name="objections" value="${arr }">신청</button><br>
 	 	</c:forEach>
				<input type="button" value="이의제기">
			</form>
	</div>


	<script>
		function request(arr){
			var send = confirm("이의신청 하시겠습니까?");
			if(send){	//확인 버튼 눌렀 -> YES
				//신청 버튼 없애기
				//insert하기
				$("#objgogo").submit();
				alert("신청완료");
// 				window.open("about:blank","_self").close();
			}
		}		
	</script>
</body>
</html>