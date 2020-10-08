<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8"); //받아오는 값들을 한글로 인코딩합니다.

	String dbURL = "jdbc:mysql://218.233.193.37:3306/team04?serverTimezone=Asia/Seoul"; // localhost:3306 포트는 컴퓨터설치된 mysql주소
	String dbID = "team04";
	String dbPassword = "KIT";
	Class.forName("com.mysql.jdbc.Driver");

	String name = request.getParameter("name"); //write.jsp에서 name에 입력한 데이터값
	String password = request.getParameter("password");//write.jsp에서 password에 입력한 데이터값
	String title = request.getParameter("title"); //write.jsp에서 title에 입력한 데이터값
	String memo = request.getParameter("memo"); //write.jsp에서 memo에 입력한 데이터값
	int max = 0;

	try {
		Connection conn = DriverManager.getConnection(dbURL, dbID, dbPassword);//DB연결
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT MAX(NUM) FROM listtbl";
		ResultSet rs = stmt.executeQuery(sql);
		
		if(rs.next()){
			max=rs.getInt(1);
		}

		sql = "INSERT INTO listtbl(userName,userPW,TITLE,MEMO,REF) VALUES(?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, name);
		pstmt.setString(2, password);
		pstmt.setString(3, title);
		pstmt.setString(4, memo);
		pstmt.setInt(5, max+1);
		
		pstmt.execute();
		pstmt.close();
		stmt.close();
		conn.close();
} catch(SQLException e) {
	out.println( e.toString() );
	}
%>
<script language=javascript>
   self.window.alert("입력한 글을 저장하였습니다.");
   location.href="list.jsp";
   </script>