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

		.btn_color{
           background-color: white;
           color: #4682B4;
           margin: 5px;            
        }
        .btn_color:hover {
           background-color: #f2f2f2;
           color: #4682B4;  
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
        <td class="dropdown">
            <button class="btn dropdown-toggle btn-group btn_color" type="button" data-toggle="dropdown">
                시청자
                <span class="caret"></span>
            </button>
                <ul class="dropdown-menu">
                    <li><a href="#">블랙리스트 추가</a></li>
                   <li><a href="#">운영자 추가</a></li>
                   <li><a href="manage_user_chatting.do">채팅 모아보기</a></li>
               </ul>
        </td>
        <td>
            나쁜시청자
            <button><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
        </td>
        <td>
            권력자1
            <button><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
        </td>
      </tr>
      <tr class="user_list">
        <td class="dropdown">
            <button class="btn dropdown-toggle btn-group btn_color" type="button" data-toggle="dropdown">
                시청자
                <span class="caret"></span>
            </button>
                <ul class="dropdown-menu">
                    <li><a href="#">블랙리스트 추가</a></li>
                   <li><a href="#">운영자 추가</a></li>
                   <li><a href="manage_user_chatting.do">채팅 모아보기</a></li>
               </ul>
        </td>
        <td>
            나쁜시청자
            <button><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
        </td>
        <td>
            권력자1
            <button><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
        </td>
      </tr>
      <tr class="user_list">
        <td class="dropdown">
            <button class="btn dropdown-toggle btn-group btn_color" type="button" data-toggle="dropdown">
                시청자
                <span class="caret"></span>
            </button>
                <ul class="dropdown-menu">
                    <li><a href="#">블랙리스트 추가</a></li>
                   <li><a href="#">운영자 추가</a></li>
                   <li><a href="manage_user_chatting.do">채팅 모아보기</a></li>
               </ul>
        </td>
        <td>
            나쁜시청자
            <button><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
        </td>
        <td>
            권력자1
            <button><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
        </td>
      </tr>
      <tr class="user_list">
        <td class="dropdown">
            <button class="btn dropdown-toggle btn-group btn_color" type="button" data-toggle="dropdown">
                시청자
                <span class="caret"></span>
            </button>
                <ul class="dropdown-menu">
                    <li><a href="#">블랙리스트 추가</a></li>
                   <li><a href="#">운영자 추가</a></li>
                   <li><a href="manage_user_chatting.do">채팅 모아보기</a></li>
               </ul>
        </td>
        <td>
            나쁜시청자
            <button><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
        </td>
        <td>
            권력자1
            <button><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
        </td>
      </tr>
      <tr class="user_list">
        <td class="dropdown">
            <button class="btn dropdown-toggle btn-group btn_color" type="button" data-toggle="dropdown">
                시청자
                <span class="caret"></span>
            </button>
                <ul class="dropdown-menu">
                    <li><a href="#">블랙리스트 추가</a></li>
                   <li><a href="#">운영자 추가</a></li>
                   <li><a href="manage_user_chatting.do">채팅 모아보기</a></li>
               </ul>
        </td>
        <td>
            나쁜시청자
            <button><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
        </td>
        <td>
            권력자1
            <button><span class="glyphicon glyphicon-minus" aria-hidden="true"></span></button>
        </td>
      </tr>

   </table>
</div>

</html>