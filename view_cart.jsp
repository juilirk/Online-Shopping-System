<%
	Vector v = (Vector)session.getAttribute("prodlist");
	if(v==null)
	{
		response.sendRedirect("user_home.jsp");
		return;
	}
%>
<body style='background:lightgrey;'>
<%@page import="java.util.*,java.sql.*"%>
<jsp:include page="user_home.jsp"></jsp:include>
<style>
td,th
{
padding:10px;
}
</style>
<br><br>
<table border=1 style='background:linen;' align='center'>
<tr style='background:red;'>
<th>Sr.No.</th>
<th>Product Name</th>
<th>Rate</th>
<th>Discount(%)</th>
<th>Qty</th>
<th>Size</th>
<th>Color</th>
<th>Amount</th>
</tr>
<%
	String type = request.getParameter("type");

	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:clothing","postgres","");
	PreparedStatement ps = con.prepareStatement("select * from products where product_id=?");

	int i=1;
	float tot=0;
	for(int j=0;j<v.size();j++){
		Vector rec = (Vector)v.get(j);
		int pid = Integer.parseInt(rec.get(0).toString());

		ps.setInt(1,pid);
		ResultSet rs = ps.executeQuery();
		rs.next();
		float amt = rs.getFloat(3) - rs.getFloat(3)%rs.getFloat(5)/100;
		tot+=amt;
%>
<td><%=i%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getFloat(3)%></td>
<td><%=rs.getFloat(5)%></td>
<td><%=rec.get(1)%></td>
<td><%=rec.get(2)%></td>
<td><%=rec.get(3)%></td>
<td><%=amt%></td>
</tr>
<%
		i++;
	}
%>
<tr>
	<td colspan=7 align='right'><b>Total:</b></td>
	<td>Rs.<%=tot%>/-</td>
</tr>
</table><br>
<table width='40%' align='center'>
<tr>
	<td><a href='disp_prod.jsp?type=<%=type%>' class='menu3'>Continue Shopping</a></td>
	<td><a href='check_out.jsp' class='menu3'>Checkout</a></td>
</tr>
</table>
<%
	session.setAttribute("tot",tot);
%>
</body>

