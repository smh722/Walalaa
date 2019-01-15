<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="css/styles.css" type="text/css"
	charset="utf-8" />
<link href="/Walala2019/src/main/webapp/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>

<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>
<style>
table.findpassword_table {
	margin-top: 20px;
	margin-bottom: 20px;
	width: 100%;
	max-width: 100%;
}

tr td {
	padding-bottom: 15px;
}

td.findpasswordlist {
	text-align: center;
}

div.findpassword_main {
	position: absolute;
	top: 10%;
	left: 30%;
	width: 40%;
}
</style>
<title>비밀번호 찾기</title>
</head>
<body>

	<jsp:include page="search_navbar.jsp"></jsp:include>
	<div class="findpassword_main"
		style="margin: 100px; text-align: center">
		<h2>비밀번호 찾기</h2>
		<hr>
		<form action="findpassword.do" method="post">
			<table class="findpasswordlist">
				<tr>
					<td class="findpasswordlist">
						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">Email</label>
						</div>
					</td>
					<td>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="inputEmail"
								name="email" placeholder="example@example.com">
						</div>
					</td>
				</tr>

				<tr>
					<td>
						<%
							if (request.getAttribute("password") != null) {
						%> <%=request.getAttribute("password")%> <%
 	}
 %>
					</td>
				</tr>
			</table>
			<input type="submit" class="btn100 rounded" value="비밀번호찾기" /> <a
				href="loginform.do" class="btn_a100 rounded">로그인페이지</a>
		</form>
	</div>
</body>
</html>