<%@page import="java.sql.*"%>
<jsp:include page="user_home.jsp"></jsp:include>
<%
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");

	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:clothing","postgres","");

	PreparedStatement ps = con.prepareStatement("update users set passwd=?,name=?,address=?,phone=? where emailid=?");
	
	ps.setString(1,pass);
	ps.setString(2,name);
	ps.setString(3,addr);
	ps.setString(4,phone);
	ps.setString(5,email);

	ps.executeUpdate();
%>
<div style='text-align:center;padding:30px;'><h1>Profile updated successfully.</h1></div>
