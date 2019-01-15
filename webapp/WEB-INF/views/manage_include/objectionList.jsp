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
   <link href="${pageContext.request.contextPath}/assets/css/bit.css" rel="stylesheet">
   
    <!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
    <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-1.12.4.js"></script>
    <!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->
    <script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
	        <style>
	            body{
	                padding: 0px;
	                margin: 0px;
	            }
	            table.ob_table{
	                margin: 5px;
	                border-bottom: solid 1px;
	                border-bottom-color: lightgray;
	                width: 99%;
	                font-size: 15px;
	                text-align: center;
	            }
	            table th{
	                text-align: center;
	                margin-bottom: 5px;
	            }
	            tr.ob_list td{
	                text-align: center;
	                font-size: 13px;
	            }
	            a{
	                
	            }
	    </style>


    </head>
    <div>
        <table class="ob_table">
            <tr>
                <th class='col-xs-1'>닉네임</th>
                <th class='col-xs-5'>내용</th>
                <th class='col-xs-1'>경고 </th>
                <th class='col-xs-1'>승인여부</th>
                <th class='col-xs-1'>상태</th>
                <th class='col-xs-2'>시간</th>
            </tr>
            <!-- list 수만큼 반복-->
            <tr class="ob_list">
                <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">닉네임12</button> 
                <!---->
                
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
                <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">닉네임12</button> 
                <!---->
                
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
                <td><button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bs-example-modal-sm">닉네임12</button> 
                <!---->
                
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
					<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-sm">
                          <div class="modal-content">
                         		  채팅금지<br>
                            	  추방하기<br>
                            	  신고하기<br>
                             	  블랙리스트<br>
                            	  운영자 추가 <br>
                          </div>
                        </div>
                      </div>
</html>