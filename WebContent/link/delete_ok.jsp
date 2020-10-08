<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("UTF-8");
Class.forName("com.mysql.jdbc.Driver");
	String dbURL = "jdbc:mysql://218.233.193.37:3306/team04?serverTimezone=Asia/Seoul"; // localhost:3306 포트는 컴퓨터설치된 mysql주소
	String dbID = "team04";
	String dbPassword = "KIT";
	String password = null;
	int idx = Integer.parseInt(request.getParameter("idx"));
	String passw = request.getParameter("password");

	try {

		Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);//DB연결
		Statement stmt = conn.createStatement();

		String sql = "SELECT userPW FROM listtbl WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);

		if (rs.next()) {
			password = rs.getString(1);
		}

		if (password.equals(passw)) {

			sql = "DELETE FROM listtbl WHERE NUM=" + idx;
			stmt.executeUpdate(sql);
%>
<script language=javascript>
	self.window.alert("해당 글을 삭제하였습니다.");
	location.href = "list.jsp";
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