<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>랄라타운 - 검색 페이지</title>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript"
   src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>

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

.thumbnail {
   width: 260px;
   height: 280px;
}
</style>

<script type="text/javascript">
   var stri = "";

   $(document).ready(function() {
      
      var tag = '${tag}';
      
       $.ajax({
               url : "${pageContext.request.contextPath}/search_result_list.do",
               type : "post",
               data: {tag:tag},
               dataType : "json",
               success : function(uploadList){
                  lineStart2();
                  for(var j=0; j<uploadList.length; j++){
                     if(j%4==0 && j!=0){
                        lineRender2(uploadList[j]);
                        
                     }else{
                        render2(uploadList[j]);
                     }
                   
                  }
                     lineEnd2();
                     $("#search_result_list").append(stri);
                  
               },
               error : function(XHR, status, error) {
                  console.error(status + " : " + error);
               }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
         
            });
   });

   function lineStart2() {
      //var str = "";

      stri += "<div class='plzrow'>";
      stri += " <div class='row' style='display: flex; margin-left:0px;'>";

      //$("#liveroom").append(str);   
      console.log("lineStart() 실행");
   }
   function render2(ChatVO) {
      //var str = "";
      stri += "   <div class='boradbox img_scale'>";
      stri += "      <div class='thumbnail scale'>";
      stri += "         <a href='#' onclick='moveRoom()'>";
      stri += "         <img src='${pageContext.request.contextPath}"+ChatVO.thumbnail+"' class='img-responsive' alt='썸네일 ' style='width: 240px; height: 140px;'></a>";
      stri += "         <div class='caption'>";
      stri += "            <h4>" + ChatVO.name + "</h4>";
      stri += "            <p> " + ChatVO.usersNickname + "</p>";
      stri += "            <p> 조회수 5만 4분전</p>";
      stri += "         </div>";
      stri += "      </div>";
      stri += "   </div>";

      console.log("render() 실행");

   }
   function lineRender2(ChatVO) {
      //var str = "";
      stri += "</div>";
      stri += "<div class='row' style='display: flex; margin-left:0px;'>";
      stri += "   <div class='boradbox img_scale'>";
      stri += "      <div class='thumbnail scale'>";
      stri += "         <a href='#' onclick='moveRoom(" + ChatVO.name + ", "
            + ChatVO.remaincount + ", " + ChatVO.totalcount + ")'>";
      stri += "         <img src='${pageContext.request.contextPath}"+ChatVO.thumbnail+"' class='img-responsive' alt='썸네일 ' style='width:240px; height:140px;'></a>";
      stri += "         <div class='caption'>";
      stri += "            <h4>" + ChatVO.name + "</h4>";
      stri += "            <p> " + ChatVO.usersNickname + "</p>";
      stri += "            <p> 조회수 5만 4분전</p>";
      stri += "         </div>";
      stri += "      </div>";
      stri += "   </div>";

   }
   function lineEnd2() {
      //var str = "";

      stri += " </div>";
      stri += "</div>";

      //$("#liveroom").append(str);   
      console.log("lineEnd() 실행");
   }
</script>



</head>
<body>
   <header>
      <jsp:include page="search_navbar.jsp"></jsp:include>
   </header>

   <div class="pageset">

      <h3>검색 결과</h3>
      <form method="post" id="">
         <div id="search_result_list" style="display: flex; margin-left: 0px;"></div>
      </form>

   </div>

</body>
</html>