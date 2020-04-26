<%@page import="java.sql.*"%>
<%
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");

	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:clothing","postgres","");
	PreparedStatement ps = con.prepareStatement("select * from users where emailid=? and passwd=?");
	ps.setString(1,email);
	ps.setString(2,pass);

	ResultSet rs = ps.executeQuery();
	if(rs.next()){
		session.setAttribute("emaild",rs.getString(1));
		session.setAttribute("uid",rs.getString(3));		
%>
<jsp:include page="user_home.jsp"></jsp:include>
<%
	}
	else{
%>
<jsp:include page="header.jsp"></jsp:include>
Login failed.<br>
Click <a href='sign_in.jsp'>here</a> to login again.
<%
	}
%>
