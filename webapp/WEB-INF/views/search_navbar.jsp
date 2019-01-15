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
	<script>
		
	</script>

<body>

	<div class="topbar">
		<div class="col-xs-3">
			<a href="main.do"> <img
				src="${pageContext.request.contextPath}/assets/images/logo.png"
				width="100px" height="30px"></a>
		</div>
		<div class="col-xs-6">
			<div class="input-group col-xs-12">
				<input type="text" class="search-query form-control "
					placeholder="Search" /> <span class="input-group-btn">
					<button class="btn btn-danger" type="button">
						<span class=" glyphicon glyphicon-search"></span>
					</button>
				</span>
			</div>
		</div>
		<div class="col-xs-3">
			<form class="navbar-form navbar-right">
				<span>
					<button type="button" class="btn btn-primary" onclick="broadcast();">
						<span class="glyphicon glyphicon-facetime-video"></span>
					</button> <!--                <span class="glyphicon glyphicon-facetime-video" aria-hidden="true"></span> -->
					<a class=login href="loginform.do">로그인</a> <a class=logout
					href="manage.do">로그아웃(현재 manage버튼)</a>
				</span>
			</form>
		</div>
	</div>

</body>
</html>