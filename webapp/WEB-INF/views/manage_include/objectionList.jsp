<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 위 3개의 메타 태그는 *반드시* head 태그의 처음에 와야합니다; 어떤 다른 콘텐츠들은 반드시 이 태그들 *다음에* 와야 합니다 -->
    <title>부트스트랩 101 템플릿</title>

    <!-- 부트스트랩 -->
    <link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet">
   
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
           <style>
               body{
                   padding: 0px;
                   margin: 0px;
               }
                              
               .tr_bottomline{
                  border-bottom: 1px solid;
                   border-bottom-color: lightgray;
                   margin-bottom: 40px;
               }        
                      
               .no_border_table{
                  border: none;
                  margin: 5px;
                  width: 99%;
                   font-size: 15px;
                   text-align: center;
                   border-collapse:collapse;
                   border-bottom:  1px solid lightgray;
               }
               table th{
                   text-align: center;
                   margin-bottom: 5px;
               }
               
               tr.ob_list td{
                   text-align: center;
                   font-size: 13px;
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
            
            .padding_td {
               padding-left: 20px;
            }
            
       </style>


    </head>
    <div>
        <table class="no_border_table">
            <tr class="tr_bottomline">
                <th class='col-xs-1'>닉네임</th>
                <th class='col-xs-5'>내용</th>
                <th class='col-xs-1'>경고 </th>
                <th class='col-xs-1'>승인여부</th>
                <th class='col-xs-1'>상태</th>
                <th class='col-xs-2'>시간</th>
            </tr>
            <!-- list 수만큼 반복-->
            
            <tr class="ob_list">
               <td class="dropdown padding_td">
                	<button class="btn dropdown-toggle btn_color btn-group" type="button" data-toggle="dropdown">
                 	 	사용자12 
                    	<span class="caret"></span></button>
                     	<ul class="dropdown-menu">
	                     	<li><a href="#">채팅금지</a></li>
	                        <li><a href="#">추방하기</a></li>
	                        <li><a href="#">신고하기</a></li>
	                        <li><a href="#">블랙리스트</a></li>
	                        <li><a href="#">운영자 추가</a></li>
                     	</ul>
                </td>
                <td>아 씹 개 거지같은 ㅡㅡ 미친새끼 채금 왜검 ㅡㅡ</td>
                <td>2</td>
                <td>                
               <button><span class="glyphicon glyphicon glyphicon-ok" aria-hidden="true"></span></button>
               <button><span class="glyphicon glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                </td>
                <td>채팅금지</td>
                <td>2019/01/15 16:30:29</td>    
            </tr>
            <tr class="ob_list">
               <td class="dropdown padding_td">
                	<button class="btn dropdown-toggle btn_color btn-group" type="button" data-toggle="dropdown">
                 	 	사용자12 
                    	<span class="caret"></span></button>
                     	<ul class="dropdown-menu">
	                     	<li><a href="#">채팅금지</a></li>
	                        <li><a href="#">추방하기</a></li>
	                        <li><a href="#">신고하기</a></li>
	                        <li><a href="#">블랙리스트</a></li>
	                        <li><a href="#">운영자 추가</a></li>
                     	</ul>
                </td>
                <td>아 씹 개 거지같은 ㅡㅡ 미친새끼 채금 왜검 ㅡㅡ</td>
                <td>2</td>
                <td>                
               <button><span class="glyphicon glyphicon glyphicon-ok" aria-hidden="true"></span></button>
               <button><span class="glyphicon glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                </td>
                <td>채팅금지</td>
                <td>2019/01/15 16:30:29</td>    
            </tr>
            <tr class="ob_list">
               <td class="dropdown padding_td">
                	<button class="btn dropdown-toggle btn_color btn-group" type="button" data-toggle="dropdown">
                 	 	사용자12 
                    	<span class="caret"></span></button>
                     	<ul class="dropdown-menu">
	                     	<li><a href="#">채팅금지</a></li>
	                        <li><a href="#">추방하기</a></li>
	                        <li><a href="#">신고하기</a></li>
	                        <li><a href="#">블랙리스트</a></li>
	                        <li><a href="#">운영자 추가</a></li>
                     	</ul>
                </td>
                <td>아 씹 개 거지같은 ㅡㅡ 미친새끼 채금 왜검 ㅡㅡ</td>
                <td>2</td>
                <td>
               <button><span class="glyphicon glyphicon glyphicon-ok" aria-hidden="true"></span></button>
               <button><span class="glyphicon glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                </td>
                <td>채팅금지</td>
                <td>2019/01/15 16:30:29</td>    
            </tr>
            
            <tr class="ob_list">
                <td class="dropdown padding_td">
                	<button class="btn dropdown-toggle btn_color btn-group" type="button" data-toggle="dropdown">
                 	 	사용자12 
                    	<span class="caret"></span></button>
                     	<ul class="dropdown-menu">
	                     	<li><a href="#">채팅금지</a></li>
	                        <li><a href="#">추방하기</a></li>
	                        <li><a href="#">신고하기</a></li>
	                        <li><a href="#">블랙리스트</a></li>
	                        <li><a href="#">운영자 추가</a></li>
                     	</ul>
                </td>
                <td>아 씹 개 거지같은 ㅡㅡ 미친새끼 채금 왜검 ㅡㅡ</td>
                <td>2</td>
                <td>
               <button><span class="glyphicon glyphicon glyphicon-ok" aria-hidden="true"></span></button>
               <button><span class="glyphicon glyphicon glyphicon-remove" aria-hidden="true"></span></button>
                </td>
                <td>채팅금지</td>
                <td>2019/01/15 16:30:29</td>    
            </tr>
            <!--반복-->
        </table>
    </div>   
    
    
    <script>
    
    $(function() {
		timer = setInterval( function () {
			var id = "";
			id = $("#userId").val();
					$.ajax({
			            type : "post",
			            url : "getObjList.do",
				        async: true,
			            data : id,
			            success : function(warnCnt){
			               
			            $("#warnCnt").val("경고" + warnCnt + "회");
			               
			            },
			            error : function(XHR, status, error) {
			               console.error(status + " : " + error);
			            }                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
			      
			         });
		}, 30000); // 1초에 한번씩 받아온다.
	});
    
    </script>

</html>