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

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>

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
   <script type="text/javascript">
   
   var str = "";

      $(document).ready(function(){
         //데이타요청(채팅방 리스트)aa
         $.ajax({
            url : "getRoomList.do",
            type : "post",
            
            dataType : "json",
            success : function(RoomList){
               console.log(RoomList);
               lineStart();
               var endNum = RoomList.length - 1;
               for(var i=0; i<RoomList.length; i++){
                  if(i%4==0 && i!=0){
                     lineRender(RoomList[i], "down");
                     
                  }else{
                     render(RoomList[i], "down");
                  }
               }
               lineEnd();
               $("#liveroom").append(str);
               /* 화면그리기 */
               //render(guestbookVo);      
            },
            error : function(XHR, status, error) {
               console.error(status + " : " + error);
            }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
      
         });
         //그리기 render사용as
         
      });

      function lineStart(){
         //var str = "";
         
         str += "<div class=\"plzrow\">";
         str += " <div class=\"row\" style=\"display: flex; margin-left:0px;\">";
         
         //$("#liveroom").append(str);   
         console.log("lineStart() 실행");
      }
      function render(ChatVO, updown){
         //var str = "";
         str += "   <div class=\"boradbox img_scale\">";
         str += "      <div class=\"thumbnail scale\">";
         str += "         <a href=\"#\" onclick=\"moveRoom('"+ChatVO.name+"', "+ChatVO.remaincount+", "+ChatVO.totalcount+", '"+ChatVO.pwd+"')\">";
         str += "         <img src=\"${pageContext.request.contextPath}/assets/images/battleground.jpg\" class=\"img-responsive\" alt=\"썸네일 \"></a>";
         str += "         <div class=\"caption\">";
         str += "            <h4>" +ChatVO.name+"</h4>";
         str += "            <p> RickyOffical</p>";
         str += "            <p> 조회수 5만 4분전</p>";
         str += "         </div>";
         str += "      </div>";
         str += "   </div>";
         
         if(updown == "up"){
            //$("#liveroom").prepend(str);   
         }else if(updown == "down"){
            //$("#liveroom").append(str);   
         }else{
            console.log("입력오류");
         }
         
         console.log("render() 실행");
         
      }   
      function lineRender(ChatVO, updown){
         //var str = "";
         str += "</div>";
         str += "<div class=\"row\" style=\"display: flex; margin-left:0px;\">";
         str += "   <div class=\"boradbox img_scale\">";
         str += "      <div class=\"thumbnail scale\">";
         str += "         <a href=\"#\" onclick=\"moveRoom('"+ChatVO.name+"', "+ChatVO.remaincount+", "+ChatVO.totalcount+", '"+ChatVO.pwd+"')\">";
         str += "         <img src=\"${pageContext.request.contextPath}/assets/images/battleground.jpg\" class=\"img-responsive\" alt=\"썸네일 \"></a>";
         str += "         <div class=\"caption\">";
         str += "            <h4>" +ChatVO.name+"</h4>";
         str += "            <p> RickyOffical</p>";
         str += "            <p> 조회수 5만 4분전</p>";
         str += "         </div>";
         str += "      </div>";
         str += "   </div>";
         
         if(updown == "up"){
            //$("#liveroom").prepend(str);   
         }else if(updown == "down"){
            //$("#liveroom").append(str);   
         }else{
            console.log("입력오류");
         }
         console.log("lineRender() 실행");
      }   
      function lineEnd(){
         //var str = "";
         
         str += " </div>";
         str += "</div>";
         
         //$("#liveroom").append(str);   
         console.log("lineEnd() 실행");
      }
         
//       }   
   </script>
   

</head>
<body>
   <header>
      <jsp:include page="search_navbar.jsp"></jsp:include>
   </header>

   <div class="pageset">
      <h3>실시간 스트리밍</h3>
      <form action="MoveChatRoom.do" method="post" id="moveChatForm">
		<input type="hidden" name="roomName" value="">
      	<div id="liveroom" style="display: flex; margin-left:0px;"></div>
      </form>
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
    <!-- 방송 들어가기 -->
   <script>
	   function moveRoom(room,remaincount,totalcount,pwd) {
			   
			      //비밀번호가 없다면 바로 이동하도록한다.
			      $("[name='roomName']").val(room);               
			      $("#moveChatForm").submit();   
	   }
   </script>
   
</body>
</html>