<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>와랄라팟에 오신걸 환영합니다!! 다같이 와랄ㄹ라랄라라</title>

<!-- 부트스트랩 -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/assets/css/basic.css" rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>

<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>
<%-- <script   type="text/javascript" src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script> --%>

	<style>
		.scale {
		   transform: scale(1);
		   -webkit-transform: scale(1);
		   -moz-transform: scale(1);
		   -ms-transform: scale(1);
		   -o-transform: scale(1);
		   transition: all 0.3s ease-in-out; /* 부드러운 모션을 위해 추가*/
		}
		
		.scale:hover {
		   transform: scale(1.2);
		   -webkit-transform: scale(1.2);
		   -moz-transform: scale(1.2);
		   -ms-transform: scale(1.2);
		   -o-transform: scale(1.2);
		}
		
		.img_scale { /*width:325px; height:280px;*/
		   overflow: hidden
		} /* 부모를 벗어나지 않고 내부 이미지만 확대 */
		.boradbox {
		   width: 263px;
		   margin-right: 12px;
		}
		
		.pageset {
		   width: 1080px;
		   margin: 0 auto;
		   margin-top: 30px;
		}
	</style>


</head>
<body>
   <header>
      <jsp:include page="search_navbar.jsp"></jsp:include>
   </header>

   <div class="pageset">
      <h3>실시간 스트리밍</h3>
      <div class="row" style="display: flex; margin-left:0px;">
         <div class="boradbox img_scale">
            <div class="thumbnail scale">
               <a href="broadcast.do"> 
               <img src="${pageContext.request.contextPath}/assets/images/battleground.jpg" class="img-responsive" alt="썸네일 "></a>
               <div class="caption">
                  <h4>[RickyTV] 사녹에서 치킨먹기</h4>
                  <p>RickyOffical</p>
                  <p>조회수 5만 4분전</p>
               </div>
            </div>
         </div>

         <div class="boradbox img_scale">
            <div class="thumbnail scale">
               <a href="broadcast.do"> 
               <img src="${pageContext.request.contextPath}/assets/images/battleground.jpg" class="img-responsive" alt="썸네일 "></a>
               <div class="caption">
                  <h4>[RickyTV] 사녹에서 치킨먹기</h4>
                  <p>RickyOffical</p>
                  <p>조회수 5만 7분전</p>
               </div>
            </div>
         </div>

         <div class="boradbox img_scale">
            <div class="thumbnail scale">
               <a href="broadcast.do"> 
               <img src="${pageContext.request.contextPath}/assets/images/battleground.jpg" class="img-responsive" alt="썸네일 "></a>
               <div class="caption">
                  <h4>[RickyTV] 사녹에서 치킨먹기</h4>
                  <p>RickyOffical</p>
                  <p>조회수 5만 7분전</p>
               </div>
            </div>
         </div>

         <div class="boradbox img_scale">
            <div class="thumbnail scale">
               <a href="broadcast.do"> 
               <img src="${pageContext.request.contextPath}/assets/images/battleground.jpg" class="img-responsive" alt="썸네일 "></a>
               <div class="caption">
                  <h4>[RickyTV] 사녹에서 치킨먹기</h4>
                  <p>RickyOffical</p>
                  <p>조회수 5만 7분전</p>
               </div>
            </div>
         </div>
      </div>

      <h3>인기 업로드</h3>
      <div class="row" style="display: flex; margin-left:0px;">
         <div class="boradbox img_scale">
            <div class="thumbnail scale">
               <a href="broadcast.do"> 
               <img src="${pageContext.request.contextPath}/assets/images/battleground.jpg" class="img-responsive" alt="썸네일 "></a>
               <div class="caption">
                  <h4>[RickyTV] 사녹에서 치킨먹기</h4>
                  <p>RickyOffical</p>
                  <p>조회수 5만 4분전</p>
               </div>
            </div>
         </div>

         <div class="boradbox img_scale">
            <div class="thumbnail scale">
               <a href="broadcast.do"> 
               <img src="${pageContext.request.contextPath}/assets/images/battleground.jpg" class="img-responsive" alt="썸네일 "></a>
               <div class="caption">
                  <h4>[RickyTV] 사녹에서 치킨먹기</h4>
                  <p>RickyOffical</p>
                  <p>조회수 5만 2분전</p>
               </div>
            </div>
         </div>

         <div class="boradbox img_scale">
            <div class="thumbnail scale">
               <a href="broadcast.do"> 
               <img src="${pageContext.request.contextPath}/assets/images/battleground.jpg" class="img-responsive" alt="썸네일 "></a>
               <div class="caption">
                  <h4>[RickyTV] 사녹에서 치킨먹기</h4>
                  <p>RickyOffical</p>
                  <p>조회수 5만 7분전</p>
               </div>
            </div>
         </div>

         <div class="boradbox img_scale">
            <div class="thumbnail scale">
               <a href="broadcast.do"> 
               <img src="${pageContext.request.contextPath}/assets/images/battleground.jpg" class="img-responsive" alt="썸네일 "></a>
               <div class="caption">
                  <h4>[RickyTV] 사녹에서 치킨먹기</h4>
                  <p>RickyOffical</p>
                  <p>조회수 5만 7분전</p>
               </div>
            </div>
         </div>
      </div>
   </div>
</body>
</html>