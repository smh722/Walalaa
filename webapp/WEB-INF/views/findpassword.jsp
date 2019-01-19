<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/styles.css" type="text/css" charset="utf-8" />
<link href="/Walala2019/src/main/webapp/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>

	<style>
		table.findpassword_table {
			margin: 20px auto;
			width: 80%;
		}
		
		tr td {
			padding-bottom: 15px;
		}
		td.findpasswordlist {
			text-align: center;
		}
		.pageset {
			width: 1080px;
			margin: 0 auto;
		}
		h1 {
			text-align: center;
		}
	</style>
<title>비밀번호 찾기</title>
</head>
<body>

	<jsp:include page="search_navbar.jsp"></jsp:include>
	
	<div class="pageset">
		<h1>비밀번호 찾기</h1>
		<hr>
		<form action="findpassword.do" method="post">
			<table class="findpassword_table">
				<tr>
					<td class="findpasswordlist">
						<div class="form-group">
							<label for="inputEmail" class="col-sm-2 control-label">Email</label>
						</div>
					</td>
					<td>
						<div class="col-sm-10">
							<input type="email" class="form-control" id="inputEmail" name="email" placeholder="example@example.com">
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
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-primary">비밀번호찾기</button>
						<a href="loginform.do">로그인페이지</a>		
					</td>
				</tr>
			</table>
			
		</form>
	</div>
</body>
</html>