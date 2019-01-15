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
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet">

<!-- 내 CSS -->
<link href="${pageContext.request.contextPath}/assets/css/bit.css"
	rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script
	src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
<style>
table.joinform_table {
	margin-top: 20px;
	margin-bottom: 20px;
	width: 100%;
	max-width: 100%;
}

tr td {
	padding-bottom: 15px;
}

td.joinformlist {
	text-align: center;
}

div.joinform_main {
	position: absolute;
	top: 10%;
	left: 30%;
	width: 40%;
}
</style>
</head>

<body>

	<jsp:include page="search_navbar.jsp"></jsp:include>

	<div class="joinform_main" style="margin: 100px; text-align: center">
		<h1>회원가입</h1>
		<hr>
		<table class='joinform_table'>
			<form class="form-horizontal">
				<tr>
					<td class="joinformlist">
						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">Email</label>
					</td>
					<td>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="inputEmail"
								placeholder="example@example.com">
						</div>
					</td>
				</tr>
				<tr>
					<td class="joinformlist">
						<div class="form-group">
							<label for="inputPassword"
								class="col-sm-2 control-label joinformlist">Password</label>
					</td>
					<td>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="inputPasswor3"
								placeholder="Password">
						</div>

					</td>
				</tr>
				<tr>
					<td class="joinformlist">
						<div class="form-group">
							<label for="inputNickname"
								class="col-sm-2 control-label joinformlist">Nickname</label>
					</td>
					<td>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputNickname"
								placeholder="Nick-name">
						</div>
					</td>
				</tr>
			</form>
		</table>
		<button type="submit" class="btn btn-primary">회원가입</button>
	</div>




</body>
</html>