<body bgcolor='cyan'>
<header>
<jsp:include page="header.jsp"></jsp:include>
</header>

<article style='padding:30px;'>

<%@page import="java.sql.*"%>
<table width='100%' style='padding:15px;'>
<tr>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:clothing","postgres","");

	String gender = request.getParameter("gender");
	String type = request.getParameter("type");
	String brand = request.getParameter("brand");

	if(!gender.equals(""))
	{
		PreparedStatement ps = con.prepareStatement("select * from products where gender=?");
		ps.setString(1,gender);
		ResultSet rs = ps.executeQuery();
		int i=0;
		while(rs.next()){
%>
<td style='padding:15px;text-align:center;'>
<img src='<%="images/"+rs.getInt(1)+".jpg"%>' width=200 height=200/><br>
<p style='font-size:14pt;font-weight:bold;'><%=rs.getString(2)%></p>
<p>Rs.<%=rs.getFloat(3)%>/-(-<%=rs.getInt(5)%>%)</p>
</td>
<%
			i++;
			if(i%3==0){
%>
</tr><tr>
<%
			}
		}
	}

	if(!type.equals(""))
	{
		PreparedStatement ps = con.prepareStatement("select * from products where product_desc like '%"+type+"%'");
		ResultSet rs = ps.executeQuery();
		int i=0;
		while(rs.next()){
%>
<td style='padding:15px;text-align:center;'>
<img src='<%="images/"+rs.getInt(1)+".jpg"%>' width=200 height=200/><br>
<p style='font-size:14pt;font-weight:bold;'><%=rs.getString(2)%></p>
<p>Rs.<%=rs.getFloat(3)%>/-(-<%=rs.getInt(5)%>%)</p>
</td>
<%
			i++;
			if(i%3==0){
%>
</tr><tr>
<%
			}
		}
	}

	if(!brand.equals(""))
	{
		PreparedStatement ps = con.prepareStatement("select * from products where product_desc like '%"+brand+"%'");
		ResultSet rs = ps.executeQuery();
		int i=0;
		while(rs.next()){
%>
<td style='padding:15px;text-align:center;'>
<img src='<%="images/"+rs.getInt(1)+".jpg"%>' width=200 height=200/><br>
<p style='font-size:14pt;font-weight:bold;'><%=rs.getString(2)%></p>
<p>Rs.<%=rs.getFloat(3)%>/-(-<%=rs.getInt(5)%>%)</p>
</td>
<%
			i++;
			if(i%3==0){
%>
</tr><tr>
<%
			}
		}
	}
%>

</table>

</article>

<footer>
<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
