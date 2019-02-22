<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>유저 채팅 관리창</title>

<!-- 부트스트랩 -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>

	<style>
	table.user_chatting {
		border-collapse: collapse;
	    margin: 5px;
	    width: 99%;
	    font-size: 17px;
	}
	
	tbody {
		border: solid 2px lightgray;
	}
	tbody>tr{
		height: 32px;
		border: lightgray 1px dotted;
	}
	tbody>td{
		padding-top: 5px;
	}

	.pageset{
		width: 1080px;
		margin:0 auto;
	}
	.sysdate{
		text-align: right;
	}

	</style>
	<script type="text/javascript">
		function btn_js_report_click() {
			/* confirm(문자열, 초기값) */
			var check = confirm("정말로 신고하시겠습니까?\n허위 신고시 제재를 받을 수 있습니다");
			/* if(check == true) else false */
			if (check)
				alert("신고되었습니다");
		}
		function btn_js_delete_click() {
			/* confirm(문자열, 초기값) */
			var check = confirm("정말로 삭제하시겠습니까?");
			/* if(check == true) else false */
			if (check)
				alert("삭제되었습니다");
		}
	</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/search_navbar.jsp"></jsp:include>
	
	
	<div class="pageset">
		<table class="user_chatting">
			<thead>
				<tr>
					<th colspan="2" class="col-xs-9">
					<img src="${pageContext.request.contextPath}/assets/images/user.png">시청자13
					님의 채팅 모아보기</th>
					<th class="col-xs-1" align="right"><button>채팅금지</button></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="col-xs-1"><input type="checkbox"></td>
					<td >ㅅㅂ 개못하는데 이런방송 왜봄?</td>
					<td class="col-xs-1 sysdate" align="right">16:32:01</td>
				</tr>
				<tr>
					<td class="col-xs-1"><input type="checkbox"></td>
					<td >ㅅㅂ 개못하는데 이런방송 왜봄?</td>
					<td class="col-xs-1 sysdate" align="right">16:32:01</td>
				</tr>
				<tr>
					<td class="col-xs-1"><input type="checkbox"></td>
					<td >ㅅㅂ 개못하는데 이런방송 왜봄?</td>
					<td class="col-xs-1 sysdate" align="right">16:32:01</td>
				</tr>
				<tr>
					<td class="col-xs-1" ><input type="checkbox"></td>
					<td >ㅅㅂ 개못하는데 이런방송 왜봄?</td>
					<td class="col-xs-1 sysdate" align="right">16:32:01</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>

					<td colspan="3">
						<input type="button" value="신고" name="btn_js_report" id="btn_js_report" onclick="btn_js_report_click();">
						<input type="button" value="삭제" name="btn_js_delete" id="btn_js_delete" onclick="btn_js_delete_click();">
					</td>
				</tr>
			</tfoot>
		</table>
		<a href="manage.do">관리자창으로 돌아가기</a>

	</div>

</body>
</html>