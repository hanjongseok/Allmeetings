<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page import="java.sql.*,java.text.SimpleDateFormat,java.util.Date"%>
<%
	final int ROWSIZE = 10;
	final int BLOCK = 10;

	int pg = 1;

	if (request.getParameter("pg") != null) {
		pg = Integer.parseInt(request.getParameter("pg"));
	}

	int start = (pg * ROWSIZE) - (ROWSIZE - 1);
	int end = (pg * ROWSIZE);

	int allPage = 0;

	int startPage = ((pg - 1) / BLOCK * BLOCK) + 1;
	int endPage = ((pg - 1) / BLOCK * BLOCK) + BLOCK;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="https://fonts.googleapis.com/css?family=Lobster"
	rel="stylesheet">
<!-- bootstrap nav bar -->
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="../css/styles.css" type="text/css" />
<link rel="stylesheet" href="../css/footer.css">
<title>All-Meetings</title>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- 헤더 인클루드 -->
	<%@ include file="../include/header.jsp"%>
	<!--  -->
	<br>
	<%
		Class.forName("com.mysql.jdbc.Driver");
		String dbURL = "jdbc:mysql://218.233.193.37:3306/team04?serverTimezone=Asia/Seoul"; // localhost:3306 포트는 컴퓨터설치된 mysql주소        
		String dbID = "team04";
		String dbPassword = "KIT";
		int total = 0;

		try {
			Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);//DB연결
			Statement stmt = conn.createStatement(); //Statement타입의 객체생성
			Statement stmt1 = conn.createStatement();
			String sql = "";

			String sqlCount = "SELECT COUNT(*) FROM listTBL"; // DB내의 자료개수를 찾는 SQL문
			ResultSet rs = stmt.executeQuery(sqlCount); // DB실행

			if (rs.next()) { // rs.next()의 반환값은 true or false입니다. 찾는결과가 있으면 true
				total = rs.getInt(1); // SELECT문의 첫번째 필드 여기선 COUNT(*)
			}
			//rs.close();
			//
			int sort = 1;
			String sqlSort = "SELECT NUM from listtbl ORDER BY REF DESC, STEP ASC";
			rs = stmt.executeQuery(sqlSort);

			while (rs.next()) {
				int stepNum = rs.getInt(1);
				sql = "UPDATE listtbl SET STEP2=" + sort + " where NUM=" + stepNum;
				stmt1.executeUpdate(sql);
				sort++;
			}

			allPage = (int) Math.ceil(total / (double) ROWSIZE);

			if (endPage > allPage) {
				endPage = allPage;
			}
			//

			out.print("총 게시물 : " + total + "개");// 게시물수 출력

			String sqlList = "SELECT NUM, userName, TITLE, TIME, HIT, INDENT from listtbl where STEP2 >=" + start
					+ " and STEP2 <= " + end + " order by step2 asc";
			rs = stmt.executeQuery(sqlList);// DB실행
	%>



	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr height="5">
			<td width="5"></td>
		</tr>
		<tr
			style="background: url('../img/table_mid.gif') repeat-x; text-align: center;">
			<td width="5"><img src="../img/table_left.gif" width="5"
				height="30" /></td>
			<td width="73">번호</td>
			<td width="379">제목</td>
			<td width="73">작성자</td>
			<td width="164">작성일</td>
			<td width="58">조회수</td>
			<td width="7"><img src="../img/table_right.gif" width="5"
				height="30" /></td>
		</tr>
		<%
			if (total == 0) {
		%>
		<tr align="center" bgcolor="#FFFFFF" height="30">
			<td colspan="6">등록된 글이 없습니다.</td>
		</tr>
		<%
			} else {

					while (rs.next()) {
						int idx = rs.getInt(1);
						String name = rs.getString(2);
						String title = rs.getString(3);
						String time = rs.getString(4);
						int hit = rs.getInt(5);
						int indent = rs.getInt(6);

						Date date = new Date();
						SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
						String year = (String) simpleDate.format(date);
						String yea = time.substring(0, 10);
		%>
		<tr height="25" align="center">
			<td>&nbsp;</td>
			<td><%=idx%></td>
			<td align="left">
				<%
					for (int j = 0; j < indent; j++) {
				%> &nbsp;&nbsp;&nbsp;<%
 	}
 				if (indent != 0) {
 %> <img src='../img/reply_icon.gif' /> <%
 	}
 %> <a href="view.jsp?idx=<%=idx%>&pg=<%=pg%>"><%=title%></a> <%
 	if (year.equals(yea)) {
 %> <img src='../img/new.jpg' /> <%
 	}
 %>
			</td>
			<td align="center"><%=name%></td>
			<td align="center"><%=yea%></td>
			<td align="center"><%=hit%></td>
			<td>&nbsp;</td>
		</tr>
		<tr height="1" bgcolor="#D2D2D2">
			<td colspan="6"></td>
		</tr>
		<%
			}
				}
				rs.close();
				stmt.close();
				conn.close();
			} catch (SQLException e) {
				//	out.println( e.toString() );
			}
		%>
		<tr height="1" bgcolor="#82B5DF">
			<td colspan="6" width="752"></td>
		</tr>
	</table>

	<table width="100%" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td colspan="4" height="5"></td>
		</tr>
		<tr>
			<td align="center">
				<%
					if (pg > BLOCK) {
				%> [<a href="list.jsp?pg=1">◀◀</a>] [<a
				href="list.jsp?pg=<%=startPage - 1%>">◀</a>] <%
					}
				%> <%
 	for (int i = startPage; i <= endPage; i++) {
 		if (i == pg) {
 %> <u><b>[<%=i%>]
				</b></u> <%
 	} else {
 %> [<a href="list.jsp?pg=<%=i%>"><%=i%></a>] <%
 	}
 	}
 %> <%
 	if (endPage < allPage) {
 %> [<a href="list.jsp?pg=<%=endPage + 1%>">▶</a>] [<a
				href="list.jsp?pg=<%=allPage%>">▶▶</a>] <%
 	}
 %>
			</td>
		</tr>
		<tr align="center">
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<br>
			<td>			
 			<input type=button value="글쓰기"
				OnClick="window.location='write.jsp'"></td>
		</tr>
	</table>
	<!-- 푸터 인클루드 -->
	<%@ include file="../include/footer.jsp"%>
	<!--  -->
</body>
</html>

