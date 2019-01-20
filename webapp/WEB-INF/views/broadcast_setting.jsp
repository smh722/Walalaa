<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>방송설정</title>

<!-- 부트스트랩 -->
<link
	href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css"
	rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript"	src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>

<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#imgInp").on('change', function() {
			readURL(this);
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}

	$(function() {
		$("#imgInp1").on('change', function() {
			readURL1(this);
		});
	});

	function readURL1(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah1').attr('src', e.target.result);
			}

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<script type="text/javascript">
	var bDisplay = true;
	function doDisplay() {
		var con = document.getElementById("myDIV");
		if (con.style.display == 'none') {
			con.style.display = 'block';
		} else {
			con.style.display = 'none';
		}
	}

	function check_all() {
		for (i = 0; i < my_form.mycheck.length; i++) {
			my_form.mycheck[i].checked = true;
		}
	}

	function not_check() {
		for (i = 1; i < my_form.mycheck.length; i++) {
			if (my_form.mycheck[i].checked == false) {
				my_form.mycheck[0].checked = false;
			}
		}
	}
	function uncheck_all() {
		for (i = 0; i < my_form.mycheck.length; i++) {
			my_form.mycheck[i].checked = false;
		}
	}
</script>

	<style>
		form.form-inline>div {
			padding: 10px 0px 10px 0px;
		}
		
		div.tag {
			width: 100%;
		}
		.pageset{
					width: 1080px;
					margin:0 auto;
		}
		label{
			width: 138px;
			text-align: right;
			margin-right: 30px;
		}
		.formcenter{
			margin-left: 210px;
		}
		.btn-file{
			width: 360px;
		}
	</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/search_navbar.jsp"></jsp:include>
	<div class="pageset">
		<div class="formcenter">
		<form class="form-inline" name="my_form" action="broadcast.do">
			<div class="form-group">
				<label for="exampleInputName2">방송제목: </label> 
				<input type="text" class="form-control" id="exampleInputName2" style="width: 360px;">
			</div>
			<br>

			<div class="form-inline form-group form-group-sm">
				<label for="exampleInputEmail2">카테고리:</label>
				<select	class="form-control input-lg" style="width: 360px;">
					<option>게임</option>
					<option>스포츠</option>
					<option>음악</option>
				</select>
			</div>
			<br>

			<div class="form-inline form-group">
				<label for="exampleInputName2">썸네일: </label>
				<span class="btn btn-default btn-file">
					<input type="file" id="imgInp">
					<img id="blah" src="#" alt="(권장)500*300 ">
				</span>
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputName2">워터마크 이미지: </label>
				<span class="btn btn-default btn-file">
					<input type="file" id="imgInp1">
					<img id="blah1" src="#" alt="(권장)50*50 ">
				</span>
			</div>
			<br>

			<div class="form-group">
				<label for="exampleInputName2">설명: </label>
				<textarea class="form-control" rows="3" style="width: 360px;"></textarea>
			</div>
			<br>

			<div class="tag">
				<label for="exampleInputName2">태그 설정:</label>
				<input type="text" class="form-control" placeholder="ex) 노래, 음식, 게임,(최대 50개-콤마로 구분)" style="width: 360px;">
			</div>
			<br>

			<div class="form-inline form-group form-group-sm">
				<label for="exampleInputName2">화면 공유:</label>
				<select	class="form-control input-lg" style="width: 360px;">
					<option>게임 자동 인식</option>
					<option>화면 공유</option>
					<option>사용자 지정 공유</option>
				</select>
			</div>
			<br>

			<div class="form-group">
				<fieldset id="setting_radio1">
					<label for="exampleInputName2">공개 범위:</label>
					<input type="radio"	name="setting_radio1">공개
					<input type="radio" name="setting_radio1">비공개
				</fieldset>
			</div>
			<br>

			<div class="form-group">
				<fieldset id="setting_radio2">
					<label for="exampleInputName2">실시간 채팅:</label>
					<input type="radio" name="setting_radio2">활성화
					<input type="radio" name="setting_radio2">비활성화
				<input value="고급설정" onclick="if(this.parentNode.getElementsByTagName('div')[0].style.display != ''){this.parentNode.getElementsByTagName('div')[0].style.display = '';this.value = '숨기기';}else{this.parentNode.getElementsByTagName('div')[0].style.display = 'none'; this.value = '고급설정';}"
				type="button" />
				</fieldset>
				<div id='checkbox_div' style="display: none; border: 1px solid">
					<input type="checkbox" name='mycheck' onclick="check_all();" value='all' />전체<br />
					<input type="checkbox" name='mycheck' onclick="not_check();" value='badword'>비속어<br>
					<input type="checkbox" name='mycheck' onclick="not_check();" value='ilbe_megal'>일베/메갈<br>
					<input type="checkbox" name='mycheck' onclick="not_check();" value='adult'>성인<br>
				</div>
			</div>
			<div align="center">
				<input class="btn btn-primary btn-lg" type="submit" value="방송하기">
				<input class="btn btn-primary btn-lg" type="submit" value="설정저장">
			</div>
		</form>
		</div>
	</div>
</body>