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

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>



	<style type="text/css">
	
	   .profileinfo{
	      height: auto;
	      width: 940px;
	      resize: none;
	      border: 0;
	   }
	   
	   .channelimage{
	      margin-left: auto;
	      margin-right: auto;
	      width: 1140px;
	      height: 150px;
	      
	   }
	   
	   .profileimage{
	      display: inline;
	      float: left;
	      width: 200px;
	      height: 150px;
	      position: relative;
	   }
	   .profilebg{
	      display: inline;
	      float: left;
	      width: 1140px;
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
	      width: 1140px;
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
	   .filebox {
	        transition: .5s ease;
	        opacity: 0;
	        position: absolute;
	        top: 50%;
	        left: 50%;
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
	   
	   .profilebg:hover .filebox {
	        opacity: 1;
	   }
	   .profilebg:hover .image2 {
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
	
	   .filebox label { 
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
	   .filebox input[type="file"] { /* 파일 필드 숨기기 */ 
	      position: absolute; 
	      width: 1px; 
	      height: 1px; 
	      padding: 0; 
	      margin: -1px; 
	      overflow: hidden; 
	      clip:rect(0,0,0,0); 
	      border: 0; 
	   }   
   
	/*    프로필 업로드 버튼 */
	   #uploadlabel{
	      margin-left: 140px;
	      width: 100px;
	   }
   
	/*    배경 업로드 버튼 */
	   #bglabel{
	      margin-left: 1018px;
	      margin-top: 120px;
	      width: 120px;
	   }   
      .scale {
        transform: scale(1);
        -webkit-transform: scale(1);
        -moz-transform: scale(1);
        -ms-transform: scale(1);
        -o-transform: scale(1);
        transition: all 0.3s ease-in-out;   /* 부드러운 모션을 위해 추가*/
      }
      .scale:hover {
        transform: scale(1.2);
        -webkit-transform: scale(1.2);
        -moz-transform: scale(1.2);
        -ms-transform: scale(1.2);
        -o-transform: scale(1.2);
      }
      .img_scale {/*width:325px; height:280px;*/ overflow:hidden }   /* 부모를 벗어나지 않고 내부 이미지만 확대 */
      .boradbox{
         width: 263px;
         margin-right: 15px;
      }
      .pageset{
         width: 1080px;
         margin:0 auto;
      }   
   
   
	</style>



</head>
<body>
   <jsp:include page="/WEB-INF/views/search_navbar.jsp"></jsp:include>



   <div class="channelimage">
      <div class="profilebg">
         <img class="image2" src="${pageContext.request.contextPath}/assets/images/knowsmore.png">
         <div class="filebox">
               <form action="#">
                  <label id="bglabel"for="bgimg">업로드</label>
                  <input type="file" id="bgimg">
               </form>
         </div>
      </div>
   </div>
   
   <br>
   
   <div class="channelimage">
      <div class="profileimage">         
            <img class="image img-circle" src="${pageContext.request.contextPath}/assets/images/user.png">
            <div class="middle">
               <form action="#">
                  <label id="uploadlabel"for="proimg">업로드</label>
                  <input type="file" id="proimg">
               </form>
            </div>
      </div>
      <div>
         <h1>채널이름</h1>
      </div>
      <div>
         <div>
             <h4><textarea class="profileinfo" name="profileinfo" id="profileinfo" for="textsubmit" readonly="readonly" placeholder="채널 설명"></textarea></h4> 
            <!--  <input type="textArea" id="profileinfo" readonly="readonly" value="채널 설명">-->
         </div>
         <div align="right">
            <input value="수정" id="myButton" name="myButton" type="button" >
         </div>
      </div>
   </div>

   <div class="pageset">
      <h3>녹화된영상</h3>
      <div class="row" style="display: flex;">
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
                  <p>조회수 5만 <span>7분전</span></p>
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
      
   
      <div class="row" style="display: flex;">
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
                  <p>조회수 5만 <span>2분전</span></p>
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
     
     <script type="text/javascript">
        document.getElementById('myButton').onclick = function() {
           if(this.value=="수정"){
              document.getElementById('profileinfo').readOnly = false;
              this.value='적용';
           }else{
               document.getElementById('profileinfo').readOnly = true;
               this.value='수정';
           }
       };
   </script>
</body>
</html>