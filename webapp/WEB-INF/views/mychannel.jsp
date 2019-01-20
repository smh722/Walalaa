<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>MyChannel</title>

<!-- 부트스트랩 -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	function popupOpen() {
		var popUrl = "profile.do";
		var popOption = "width=370, height=360, resizable=no, scrollbars=no, status=no;";
		window.open(popUrl, "", popOption);
	}
</script>
<style type="text/css">
	.btnopacity:hover .uploadbtn{
		opacity: 1.0;
	}
	.uploadbtn{
 		color: white;
 		font-size: 16px;
 		padding: 0px;
 		width: 148px;
	}	
	.channelimage{
		margin-left: auto;
		margin-right: auto;
		width: 1140px;
		height: 150px;
		background-color: grey;
	}
	.profileimage{
		display: inline;
		float: left;
		width: 200px;
		height: 150px;
		position: relative;
	}
	.image{
		width: 200px;
		height: 150px;
		position: absolute;
		opacity: 1;
		display: block;
		transition: .5s ease;
		backface-visibility: hidden;
	}
	.image2{
		width: 940px;
		height: 150px;
		position: absolute;
		opacity: 1;
		display: block;
		transition: .5s ease;
		backface-visibility: hidden;
	}
	.middle {
	  	transition: .5s ease;
	  	opacity: 0;
	  	position: absolute;
	  	top: 50%;
	  	left: 12%;
	  	transform: translate(-50%, -50%);
	  	-ms-transform: translate(-50%, -50%);
  		text-align: center;
	}
	.profileimage:hover .middle {
 		 opacity: 1;
	}
	.profileimage:hover .image {
  		opacity: 0.3;
	}
	
	.middle label { 
		display: inline-block; 
		padding: .5em .75em; 
		color: #999; 
		font-size: inherit; 
		line-height: normal; 
		vertical-align: middle; 
		background-color: #fdfdfd; 
		cursor: pointer; 
		border: 1px solid #ebebeb; 
		border-bottom-color: #e2e2e2; 
		border-radius: .25em; 
	} 
	
	.middle input[type="file"] { /* 파일 필드 숨기기 */ 
		position: absolute; 
		width: 1px; 
		height: 1px; 
		padding: 0; 
		margin: -1px; 
		overflow: hidden; 
		clip:rect(0,0,0,0); 
		border: 0; 
	}
	#uploadlabel{
		margin-left: 140px;
		width: 100px;
	}
	.profilebg{
		display: inline;
		float: right;
		width: 940px;
		height: 150px; 
		position: relative;
	}
	
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/views/search_navbar.jsp"></jsp:include>


	<div class="channelimage">
		<div class="profileimage">			
				<img class="image" src="${pageContext.request.contextPath}/assets/images/user.png">
				<div class="middle">
					<form action="#">
						<label id="uploadlabel"for="imgInp">업로드</label>
						<input type="file" id="imgInp">
					</form>
				</div>
		</div>
		<div class="profilebg">
			<img class="image2" src="${pageContext.request.contextPath}/assets/images/knowsmore.jpg">
			<div class="middle">
					<form action="#">
						<label id="uploadlabel"for="imgInp">업로드</label>
						<input type="file" id="imgInp">
					</form>
			</div>
		</div>
	</div>

	<div class="container">
		<h3>녹화된영상</h3>
		<hr>
		<div class="row">
			<div class="col-sm-3">
				<div class="thumbnail">
					<a href="main.do"> <img
						src="${pageContext.request.contextPath}/assets/images/battleground.jpg"
						class="img-responsive" alt="썸네일 "></a>
					<div class="caption">
						<h4>[RickyTV] 사녹에서 치킨먹기</h4>
						<p>RickyOffical</p>
						조회수 5만회
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7분전
						<!--            <p><a href="#" class="btn btn-primary" role="button">Button</a> <a href="#" class="btn btn-default" role="button">Button</a></p> -->
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

</html>