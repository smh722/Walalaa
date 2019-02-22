<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!Doctype html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>관리자창 - 분석</title>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style type="text/css">
	#analysisTable{
		border-bottom: 1px solid lightgray;
	}
	#analysisTable>tbody>tr>td{
		padding-bottom: 5px;
	}
	body{
	font-size: 15px;
	}
</style>

<script type="text/javascript">
	//------------------- 차트 사용하기 위한 준비
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		//------------------- 차트 데이터 설정
		var data = google.visualization.arrayToDataTable([
					[ '방송시간', '채팅량', '비속어 사용량'],
					[ '30분',  67,   9  ],
					[ '60분',  1170, 434 ],
					[ '90분',  660,  140 ],
					[ '120분', 1030, 298 ],
					[ '150분', 2045, 401 ],
					[ '180분', 1994, 201 ],
					[ '210분', 2067, 104 ]
				]);

		//------------------- 그래프 옵션
		var options = {
			title : '실시간 채팅량',
			vAxis: {title: '채팅량'},
			hAxis: {title: '시간 (분)'},			
			width : 550,
			height: 300,
			curveType : 'function',
			format: 'decimal',
			legend : {
		//------------------- 항목 표시 여부
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart_chatting_amount'));

		chart.draw(data, options);
	}
</script>

<script type="text/javascript">
	//------------------- 차트 사용하기 위한 준비
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		//------------------- 차트 데이터 설정
		var data = google.visualization.arrayToDataTable([
					[ '방송시간', '조회수'],
					[ '30분',  67   ],
					[ '60분',  1170 ],
					[ '90분',  660  ],
					[ '120분', 1030  ],
					[ '150분', 2045  ],
					[ '180분', 1994  ],
					[ '210분', 2067  ]
				]);

		//------------------- 그래프 옵션
		var options = {
			title : '조회수 추이',
			vAxis: {title: '조회수'},
			hAxis: {title: '시간 (분)'},			
			width : 550,
			height: 300,
			curveType : 'function',
			format: 'decimal',
			legend : {
		//------------------- 항목 표시 여부
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart_views_amount'));

		chart.draw(data, options);
	}
</script>


<script type="text/javascript">
	//------------------- 차트 사용하기 위한 준비
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		//------------------- 차트 데이터 설정
		var data = google.visualization.arrayToDataTable([
					[ '방송시간', '분'],
					[ '30분',  67   ],
					[ '60분',  1170 ],
					[ '90분',  660  ],
					[ '120분', 1030  ],
					[ '150분', 2045  ],
					[ '180분', 1994  ],
					[ '210분', 2067  ]
				]);

		//------------------- 그래프 옵션
		var options = {
			title : '평균 시청 지속시간',
			vAxis: {title: '분'},
			hAxis: {title: '시간 (분)'},			
			width : 550,
			height: 300,
			curveType : 'function',
			format: 'decimal',
			legend : {
		//------------------- 항목 표시 여부
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart_views_average'));

		chart.draw(data, options);
	}
</script>

<script type="text/javascript">
	//------------------- 차트 사용하기 위한 준비
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		//------------------- 차트 데이터 설정
		var data = google.visualization.arrayToDataTable([
					[ '방송시간', '명'],
					[ '30분',  31   ],
					[ '60분',  70 ],
					[ '90분',  75  ],
					[ '120분', 180  ],
					[ '150분', 209  ],
					[ '180분', 245  ],
					[ '210분', 299  ]
				]);

		//------------------- 그래프 옵션
		var options = {
			title : '구독자수',
			vAxis: {title: '명(누적)'},
			hAxis: {title: '시간 (분)'},			
			width : 550,
			height: 300,
			curveType : 'function',
			format: 'decimal',
			legend : {
		//------------------- 항목 표시 여부
				position : 'bottom'
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart_subscribe_amount'));

		chart.draw(data, options);
	}
</script>

</head>
<body>
	<!-- 차트 생성 구역 -->
	<table id="analysisTable">
		<tr>
			<td><div id="curve_chart_chatting_amount" style="width: 550px; height: 300px"></div></td>
			<td><div id="curve_chart_views_amount" style="width: 550px; height: 300px"></div></td>
		</tr>
		<tr>
			<td><div id="curve_chart_views_average" style="width: 550px; height: 300px"></div></td>
			<td><div id="curve_chart_subscribe_amount" style="width: 550px; height: 300px"></div></td>
		</tr>
	</table>
</body>
</html>