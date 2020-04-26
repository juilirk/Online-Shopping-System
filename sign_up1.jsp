<%@page import="java.sql.*"%>
<jsp:include page="header.jsp"></jsp:include>
<%
	String email = request.getParameter("email");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");

	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:clothing","postgres","");

	PreparedStatement ps = con.prepareStatement("select * from users where emailid=?");
	ps.setString(1,email);
	ResultSet rs = ps.executeQuery();

	if(rs.next()){
%>
You are already a registered user.<br>
<%
	}
	else
	{
		ps = con.prepareStatement("insert into users values(?,?,?,?,?)");
	
		ps.setString(1,email);
		ps.setString(2,pass);
		ps.setString(3,name);
		ps.setString(4,addr);
		ps.setString(5,phone);

		ps.executeUpdate();
%>
You are registered successfully.<br>
<%
	}
%>
Click <a href='sign_in.jsp'>here</a> to login.
