<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
<title>방송종료</title>
<!-- 부트스트랩 -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- 내 CSS -->
<link href="${pageContext.request.contextPath}/assets/css/bit.css" rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="js/bootstrap.min.js"></script>

   <style>
      .pageset {
         width: 1080px;
         margin: 0 auto;
         display: flex;
         margin-top:-10px;
      }
      
      .infopage {
         width: 660px;
      }
      
      .chatpage {
         width: 300px;
         height: 700px;
         margin-left: 20px;
         clear: both;
      }
      
      .textarea {
         resize: none; /* 사용자 임의 변경 불가 */
         overflow-y: scroll;
      }
      
      .chatScreen {
         width: 100%;
         height: 90%;
      }
      
      .chat_log {
         height: 100%;
         width: 90%;
         margin-left: 5px;
      }
      
      form.form-inline>div>div{
         padding: 5px 0px 5px 0px;
      }
      
      label{
         width: 100px;
         text-align: right;
         margin-right: 30px;
      }
      
      .btn-file{
         width: 500px;
      }
      
      #save {
         height: 50px;
         width: 70px;
          margin-left: 180px;
          margin-top: 0px;
      }
      
      .vertical_line{
         border-left: 2px solid lightgray;
           height: 740px;
      }
      
      .chatpage>h3{
         margin-left: 20px;
      }
   </style>

</head>
<body>
   <header>
      <jsp:include page="search_navbar.jsp"></jsp:include>
   </header>

   <div class="pageset">
      <form class="form-inline" name="save_broad" style="display: flex;"action="">
      <div class="infopage">
            <h3>영상 정보</h3>
            <div class="form-group">
                  <label for="exampleInputName2">제목: </label>
                  <input type="text" class="form-control" id="exampleInputName2" style="width: 500px;" value="배그 랭킹1위 막창사랑님의 방송>< 다 드루와~~">               
            </div>
            <div class="form-group">
                  <label for="exampleInputEmail2">설명:</label>
                  <textarea class="form-control" rows="3" style="width: 500px;">배그 랭킹1위 막창사랑이 와뜨아! 지리는 에임, 스크림 최다릴 보유!! 지금 현재 킬당 만원 미션즁</textarea>
            </div>
            <div class="form-inline form-group">
               <label for="exampleInputName2">썸네일: </label>
               <span class="btn btn-default btn-file">
                  <input type="file" id="imgInp">
                  <img id="blah" src="${pageContext.request.contextPath}/assets/images/game_screen.png" alt="(권장)500*300" style="width: 480px;">
               </span>
            </div>
            <div class="form-group">
                  <label for="exampleInputEmail2">방송시간:</label>
                  <input type="text" class="form-control" id="exampleInputName2" 
                  style="width: 500px;" value="1시간 29분 30초" readonly>
            </div>
            <div class="form-group">
                  <label for="exampleInputEmail2">최대화질:</label>
                  <input type="text" class="form-control" id="exampleInputName2" 
                  style="width: 500px;" value="1080p" readonly>
            </div>
            <div class="form-group">
                  <label for="exampleInputEmail2">누적 시청자수:</label>
                  <input type="text" class="form-control" id="exampleInputName2" 
                  style="width: 500px;" value="105명" readonly>
            </div>
            <div class="form-group">
                  <label for="exampleInputEmail2">태그설정:</label>
                  <input type="text" class="form-control" id="exampleInputName2" style="width: 500px;" value="배그, 배틀그라운드, 막창사랑, 막사, 막창, 랭킹1위, 배그랭킹1위">
            </div>
            <div class="form-group" style="margin-right: 230px;">
               <fieldset id="save_radio1">
                  <label for="exampleInputName2">업로드:</label>
                  <input type="radio"   name="save_radio1">공개
                  <input type="radio" name="save_radio1">비공개
                  <input type="radio" name="save_radio1">예약
               </fieldset>
            </div>
            <div class="form-group">
               <fieldset id="save_radio2">
                  <label for="exampleInputName2">저장:</label>
                  <input type="radio"   name="save_radio2">저장
                  <input type="radio" name="save_radio2">저장안함
               </fieldset>
            </div>
      </div>

      <div class="vertical_line"></div>
      
      <div class="chatpage">
         <h3>실시간 채팅 다시보기</h3>
            <div class="chatScreen">
               <textarea id="chatLog" class="chat_log textarea" readonly></textarea>
            </div>
            <div class="submit_btn" align="center">
               <input type="submit" id="save" value="확인" />
            </div>
      </div>
      </form>
   </div>
</body>
</html>