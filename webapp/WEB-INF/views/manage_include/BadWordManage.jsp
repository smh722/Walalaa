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
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet">

<!-- 내 CSS -->
<link href="${pageContext.request.contextPath}/assets/css/manage.css"
	rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script
	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>

</head>
<body>
	<style>
p {
	margin: 20px 0px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col">
				<p>
					<strong>비속어 필터 설정</strong>
				</p>
				<div class="custom-control custom-checkbox">
					<input type="checkbox" id="jb-checkbox1"	class="custom-control-input">
					<label class="custom-control-label" for="jb-checkbox1">전체</label>
					<input type="checkbox" id="jb-checkbox2"	class="custom-control-input">
					<label class="custom-control-label" for="jb-checkbox2">비속어</label>
					<input type="checkbox" id="jb-checkbox3"	class="custom-control-input">
					<label class="custom-control-label" for="jb-checkbox3">일베/메갈</label>
					<input type="checkbox" id="jb-checkbox4"	class="custom-control-input">
					<label class="custom-control-label" for="jb-checkbox4">사용자 지정</label>
				</div>
				<p>
			</div>
		</div>
	</div>
</body>


</html>