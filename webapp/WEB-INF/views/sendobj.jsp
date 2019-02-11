<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		
	</div>
	
	<script>
	var str = '${objlist}'
	$(document).ready(function(){
		$("#obj").append(str);  
	});
	</script>
</body>
</html>