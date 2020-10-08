<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="https://fonts.googleapis.com/css?family=Lobster"
	rel="stylesheet">
<!-- bootstrap nav bar -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--  -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="footer, address, phone, icons" />
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="http://fonts.googleapis.com/css?family=Cookie"
	rel="stylesheet" type="text/css">
<!--  -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<!-- bootstrap nav bar -->
<link rel="stylesheet" href="../css/styles.css" type="text/css" />
<link rel="stylesheet" href="../css/footer.css">
<title>All-Meetings : main</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style type="text/css">
.cal_top {
	text-align: center;
	font-size: 40px;
	background: linear-gradient(to right, #f00 10%, #00f 15%, #0f0 35%, #f0f 50%, #0ff
		60%, #ff7fd3 95%, #326d18 100%);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}

.cal {
	text-align: center;
}

table.calendar {
	border: 1px solid black;
	display: inline-table;
	text-align: left;
	background-color: white;
}

table.calendar td {
	vertical-align: top;
	border: 1px solid skyblue;
	width: 180px;
	background-color: white;
}

.AM {
	text-align: center;
	font-family: 'Lobster', cursive;
	font-size: 40px;
}
</style>
</head>
<body>
	<!-- 헤더 인클루드 -->
	<%@ include file="../include/header.jsp"%>
	<!--  -->
	<article>
<div class="AM">
   All-Meetings
   </div>

		<iframe
			src="https://calendar.google.com/calendar/embed?height=600&amp;wkst=1&amp;bgcolor=%23ffffff&amp;ctz=Asia%2FSeoul&amp;src=MjAxOTA5NThAZy5raXQuYWMua3I&amp;src=YWRkcmVzc2Jvb2sjY29udGFjdHNAZ3JvdXAudi5jYWxlbmRhci5nb29nbGUuY29t&amp;src=a2l0LmFjLmtyX2NsYXNzcm9vbTQyOTNmZTQ0QGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20&amp;src=a2l0LmFjLmtyX2NsYXNzcm9vbTQxMWI4YTU1QGdyb3VwLmNhbGVuZGFyLmdvb2dsZS5jb20&amp;src=a28uc291dGhfa29yZWEjaG9saWRheUBncm91cC52LmNhbGVuZGFyLmdvb2dsZS5jb20&amp;src=Zy5raXQuYWMua3JfY2xhc3Nyb29tYmZiZGFhMTNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ&amp;color=%23039BE5&amp;color=%2333B679&amp;color=%23c26401&amp;color=%23137333&amp;color=%230B8043&amp;color=%230047a8&amp;showTitle=0&amp;showPrint=0"
			style="border: solid 1px #777" width="1520" height="800"
			frameborder="0" scrolling="no"></iframe>


		<hr>
	</article>
	<!-- 푸터 인클루드 -->
	<%@ include file="../include/footer.jsp"%>
</body>
</html>
