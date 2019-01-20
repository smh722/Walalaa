<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>유상형채널</title>

<!-- 부트스트랩 -->
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/bit.css"
	rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script
	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>

</script>
</head>
<body>

	<div class="container" style="width: 1140px; height: 150px; background-color: grey;">
		<div class="row"
			style='display: inline; float: left; width: 200px; height: 150px; border: solid red; position: relative;'>썸네일</div>
		<div class="row"
			style='display: inline; float: right; width: 800px; height: 150px; border: solid blue; position: relative;'>영상</div>
	</div>
	<div class="container" style="width: 1140px; height: 150px; background-color: grey;">
		<div class="row"
			style='display: inline; float: left; width: 200px; height: 150px; border: solid red; position: relative;'>썸네일</div>
		<div class="row"
			style='display: inline; float: right; width: 800px; height: 150px; border: solid blue; position: relative;'>영상</div>
	</div>

</body>

</html>