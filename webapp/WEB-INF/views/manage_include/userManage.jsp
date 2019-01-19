<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<style>
body {
   padding: 0px;
   margin: 0px;
}

table.user_table {
   border-collapse: collapse;
   margin: 5px;
   border-bottom: solid 1px;
   border-bottom-color: lightgray;
   width: 99%;
   font-size: 15px;
   text-align: center;
}

table thead.menubar {
   border-bottom: solid 1px;
   border-bottom-color: lightgray;
}

table th {
   text-align: center;
   margin-bottom: 5px;
}

tr.user_list td {
   text-align: center;
   font-size: 15px;
   font-weight: 600;
}

.manage_area {
   font-size: 15px;
   font-weight: 600;
   text-align: center;
}

a {
   text-decoration: none;
   color: rgb(24, 21, 21);
}
</style>


</head>
<div>
   <table class="user_table">
      <thead class="menubar">
         <tr>
            <th class='col-xs-4'>현재 접속중</th>
            <th class='col-xs-4'>블랙리스트</th>
            <th class='col-xs-4'>운영자리스트</th>
         </tr>
      </thead>
      <!-- socket.io 이용해서 div 안에 자동으로 채움-->
      <tr class="user_list">
         <td>
               <a href="manage_user_chatting.do">시청자</a>
         </td>
         <td>나쁜시청자</td>
         <td>권력자1</td>
      </tr>
      <tr class="user_list">
         <td>
               <a href="manage_user_chatting.do">시청자</a>
         </td>
         <td>나쁜시청자</td>
         <td>권력자1</td>
      </tr>
      <tr class="user_list">
         <td>
               <a href="manage_user_chatting.do">시청자</a>
         </td>
         <td>나쁜시청자</td>
         <td>권력자1</td>
      </tr>
      <tr class="user_list">
         <td>
               <a href="manage_user_chatting.do">시청자</a>
         </td>
         <td>나쁜시청자</td>
         <td>권력자1</td>
      </tr>
      <tr class="user_list">
         <td>
               <a href="manage_user_chatting.do">시청자</a>
         </td>
         <td>나쁜시청자</td>
         <td>권력자1</td>
      </tr>
      <tr class="user_list">
         <td>
               <a href="manage_user_chatting.do">시청자</a>
         </td>
         <td>나쁜시청자</td>
         <td>권력자1</td>
      </tr>

   </table>
</div>

</html>
