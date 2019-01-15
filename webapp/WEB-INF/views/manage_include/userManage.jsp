<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    
        <style>
            body{
                padding: 0px;
                margin: 0px;
            }
            table.user_table{
                border-collapse: collapse;
                margin: 5px;
                border-bottom: solid 1px;
                border-bottom-color: lightgray;
                width: 99%;
                height: 80%;
                font-size: 15px;
                text-align: center;
            }
            table thead.menubar{
               border-bottom: solid 1px;
               border-bottom-color: lightgray;

            }
            table th{
                text-align: center;
                margin-bottom: 5px;
            }
            tr.user_list td{
                text-align: center;
                font-size: 13px;
            }
            .manage_area{
                height: 500px;
                font-size: 15px;
                font-weight: 600;
                text-align: center;
            }
            a{
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
                <td><div id="userlist" class="manage_area"><a href="#"> 시청자</a></div></td>
                <td><div id="blacklist" class="manage_area" >나쁜시청자</div></td>
                <td><div id="managerlist" class="manage_area" >권력자1</div></td>
            </tr>
          
        </table>
    </div>

</html>