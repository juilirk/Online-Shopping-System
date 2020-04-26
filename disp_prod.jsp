<body style='background:lightgrey;'>
<%@page import="java.sql.*"%>
<jsp:include page="user_home.jsp"></jsp:include>
<table width='100%' style='padding:15px;'>
<tr>
<%
	String type = request.getParameter("type");

	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:clothing","postgres","");
	PreparedStatement ps = con.prepareStatement("select * from products where gender=?");
	ps.setString(1,type);
	ResultSet rs = ps.executeQuery();
	int i=0;
	while(rs.next()){
%>
<td style='padding:15px;text-align:center;'>
<img src='<%="images/"+rs.getInt(1)+".jpg"%>' width=200 height=200/><br>
<p style='font-size:14pt;font-weight:bold;'><%=rs.getString(2)%></p>
<p>Rs.<%=rs.getFloat(3)%>/-(-<%=rs.getInt(5)%>%)</p>
<a href='add_cart.jsp?pid=<%=rs.getInt(1)%>&type=<%=type%>' style='font-size:12pt;padding:5px;background:red;color:white;border-radius:5px;text-decoration:none;box-shadow:5px 5px 5px #444444;'>Buy Now</a>
</td>
<%
		i++;
		if(i%3==0){
%>
</tr><tr>
<%
		}
	}
%>
</table>
</body>	


