<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->

<title>Customizing Word setting</title>

<!-- 부트스트랩 -->
<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>

<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>

<style>
body {
   padding: 10px;
   margin: 0px;
}

div.main {
   width: 100%;
   height: 70%;
   padding: 0px;
   margin: 0px;
   border: 1px lightgray solid;
}

div.sub {
   display: inline-flex;
   margin-right: -3px;
   margin-left: -3px;
}

div.checkbox {
   width: 25%;
   height: 100%;
   padding-left: 3%;
}

div.customWord {
   width: 60%;
   height: 100%;
}

div.warningCount {
   display: inline-block;
     height: 100%;
     width: 13%;
     position: relative;
   top: -30px;
   left: 3px;
}

table.wordtable {
   width: 100%;
   border-collapse: collapse;
}

tbody {
   border: solid 2px lightgray;
}

tr.wordtr {
   border-bottom: solid 1px lightgray;
}


</style>

<script type="text/javascript">
   var Display = true;
   function doDisplay() {
      var con = document.getElementById("showWarning");
      if (con.style.display == 'none') {
         con.style.display = 'block';
      } else {
         con.style.display = 'none';
      }
   }
</script>

</head>

<body>
   <div class="main">
   
      <div class="checkbox sub">
               <div class="col-md-12">
                  <p>
                     <strong>비속어 필터 설정</strong>
                  </p>
                  <div class="form-check">
                     <input type="checkbox" id="jb-checkbox1"
                        class="custom-control-input"> <label
                        class="custom-control-label" for="jb-checkbox1">전체</label>
                  </div>

                  <div class="form-check">
                     <input type="checkbox" id="jb-checkbox2"
                        class="custom-control-input"> <label
                        class="custom-control-label" for="jb-checkbox2">비속어</label>
                  </div>

                  <div class="form-check">
                     <input type="checkbox" id="jb-checkbox3"
                        class="custom-control-input"> <label
                        class="custom-control-label" for="jb-checkbox3">일베/메갈</label>
                  </div>

                  <div class="form-check">
                     <input type="checkbox" id="jb-checkbox4"
                        class="custom-control-input"> <label
                        class="custom-control-label" for="jb-checkbox4">사용자지정</label>
                  </div>
               </div>
      </div>


      <div class="customWord sub">
         <table class="wordtable">
            <thead>
               <tr>
                  <form class="form-group">
                     <td class="col-xs-1"><label for="inputword"
                        class="control-label">입력</label></td>
                     <td class="col-xs-10">
                        <div>
                           <input type="inputword" class="col-xs-11 form-control"
                              id="inputword" placeholder="영문/숫자만 입력">
                        </div>
                     </td>

                     <td class="col-xs-1">
                        <button type="submit" class="btn">추가</button>
                     </td>
                  </form>
               </tr>
               <tr>
                  <td colspan="3">
                     <h3>추가 된 단어 리스트</h3>
                  </td>
               </tr>
            </thead>
            <tbody>
               <tr class="wordtr">
                  <td class="col-xs-1">1</td>
                  <td class="col-xs-10">대머리</td>
                  <td class="col-xs-1">
                     <button type="submit" class="btn btnright">삭제</button>
                  </td>
               </tr>
               <tr class="wordtr">
                  <td class="col-xs-1">2</td>
                  <td class="col-xs-10">머머리</td>
                  <td class="col-xs-1">
                     <button type="submit" class="btn">삭제</button>
                  </td>
               </tr>
               <tr class="wordtr">
                  <td class="col-xs-1">2</td>
                  <td class="col-xs-10">머머리</td>
                  <td class="col-xs-1">
                     <button type="submit" class="btn">삭제</button>
                  </td>
               </tr>
               <tr class="wordtr">
                  <td class="col-xs-1">2</td>
                  <td class="col-xs-10">머머리</td>
                  <td class="col-xs-1">
                     <button type="submit" class="btn">삭제</button>
                  </td>
               </tr>
               <tr class="wordtr">
                  <td class="col-xs-1">2</td>
                  <td class="col-xs-10">머머리</td>
                  <td class="col-xs-1">
                     <button type="submit" class="btn">삭제</button>
                  </td>
               </tr>
               <tr class="wordtr">
                  <td class="col-xs-1">2</td>
                  <td class="col-xs-10">머머리</td>
                  <td class="col-xs-1">
                     <button type="submit" class="btn">삭제</button>
                  </td>
               </tr>
               <tr class="wordtr">
                  <td class="col-xs-1">2</td>
                  <td class="col-xs-10">머머리</td>
                  <td class="col-xs-1">
                     <button type="submit" class="btn">삭제</button>
                  </td>
               </tr>
               <tr class="wordtr">
                  <td class="col-xs-1">2</td>
                  <td class="col-xs-10">머머리</td>
                  <td class="col-xs-1">
                     <button type="submit" class="btn">삭제</button>
                  </td>
               </tr>
               <tr class="wordtr">
                  <td class="col-xs-1">2</td>
                  <td class="col-xs-10">머머리</td>
                  <td class="col-xs-1">
                     <button type="submit" class="btn">삭제</button>
                  </td>
               </tr>
            </tbody>
         </table>
      </div>

      <div class="warningCount sub">
         <a href="javascript:doDisplay();">경고 횟수 설정</a>
         <form action="">
            <div id="showWarning" style="display: none;">
               <table id="warningtable">
                  <tr>
                     <td><input type="text" class="form-control" id="inputCount"></td>
                     <td><input type="submit" class="btn" value="설정"></td>
                  </tr>
                  <tr>
                     <td colspan="2"><font color="lightgray">비속어가 3회 감지될 경우, 채팅금지 상태가 됩니다. </td>
                  </tr>
               </table>
            </div>
         </form>
      </div>


   </div>

</body>
</html>