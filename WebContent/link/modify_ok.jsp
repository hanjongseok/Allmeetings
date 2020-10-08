<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%
	Class.forName("com.mysql.jdbc.Driver");
	String dbURL = "jdbc:mysql://218.233.193.37:3306/team04?serverTimezone=Asia/Seoul"; // localhost:3306 포트는 컴퓨터설치된 mysql주소
	String dbID = "team04";
	String dbPassword = "KIT";
	String password = "";

	try {

		request.setCharacterEncoding("UTF-8");
		int idx = Integer.parseInt(request.getParameter("idx"));
/* 		int pg = Integer.parseInt(request.getParameter("pg")); */
		String title = request.getParameter("title");
		String memo = request.getParameter("memo");
		String passw = request.getParameter("password");

		Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		Statement stmt = conn.createStatement();

		String sql = "SELECT userPW FROM listtbl WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			password = rs.getString(1);
		}

		if (password.equals(passw)) {
			sql = "UPDATE listtbl SET TITLE='" + title + "' ,MEMO='" + memo + "' WHERE NUM=" + idx;
			stmt.executeUpdate(sql);
%>
<script language=javascript>
				  	self.window.alert("글이 수정되었습니다.");
			<%-- 	  	location.href="view.jsp?idx=<%=idx%>&pg=<%=pg%>"; --%>
				  	location.href="view.jsp?idx=<%=idx%>";
</script>
<%
	rs.close();
			stmt.close();
			conn.close();

		} else {
%>
<script language=javascript>
	self.window.alert("비밀번호를 틀렸습니다.");
	location.href = "javascript:history.back()";
</script>
<%
	}

	} catch (SQLException e) {
		out.println(e.toString());
	}
%>

