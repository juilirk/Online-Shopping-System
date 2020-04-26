<body style='background:url(images/bg.jpg);background-repeat: no-repeat;background-size:100%;'>
<header>
	<jsp:include page="user_header.jsp"></jsp:include>
</header>

<article style='padding:30px;'>

<%@page import="java.sql.*,java.text.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:clothing","postgres","");

	int oid = Integer.parseInt(request.getParameter("oid"));
	
	PreparedStatement ps = con.prepareStatement("select order_id, order_date, name, address, phone, order_master.emailid, total, status, pay_mode, card_no, bank_name from order_master,users where order_master.emailid = users.emailid and order_id=?");

	ps.setInt(1,oid);

	ResultSet rs = ps.executeQuery();
	
	if(rs.next()){
%>

<table width='40%' height='40%' align='center' style='background:linen;'>
<tr>
	<td><b>Order ID:</b></td>
	<td><%=rs.getString(1)%></td>
</tr>
<tr>
	<td><b>Order Date:</b></td>
	<td><%=rs.getString(2)%></td>
</tr>
<tr>
	<td><b>Customer Name:</b></td>
	<td><%=rs.getString(3)%></td>
</tr>
<tr>
	<td><b>Address:</b></td>
	<td><%=rs.getString(4)%></td>
</tr>
<tr>
	<td><b>Phone:</b></td>
	<td><%=rs.getString(5)%></td>
</tr>
<tr>
	<td><b>Email ID:</b></td>
	<td><%=rs.getString(6)%></td>
</tr>
<tr>
	<td><b>Total:</b></td>
	<td>Rs.<%=rs.getString(7)%>/-</td>
</tr>
<tr>
	<td><b>Status:</b></td>
	<td><%=rs.getString(8)%></td>
</tr>
<tr>
	<td><b>Payment Mode:</b></td>
	<td><%=rs.getString(9)%></td>
</tr>
<tr>
	<td><b>Card No:</b></td>
	<td><%=rs.getString(10)%></td>
</tr>
<tr>
	<td><b>Bank Name:</b></td>
	<td><%=rs.getString(11)%></td>
</tr>
</table><br>
<%
	ps = con.prepareStatement("select order_details.product_id, product_desc, product_rate, disc, qty, size, color, qty*product_rate-qty*product_rate*disc/100 from products, order_details where products.product_id = order_details.product_id and order_id=?");
	ps.setInt(1, oid);
	rs = ps.executeQuery();
%>
<table width='80%' align='center' style='background:linen;'>
<tr style='background:red;'>
	<th>Product ID</th>
	<th>Name</th>
	<th>Rate</th>
	<th>Discount (%)</th>
	<th>Qty</th>
	<th>Size</th>
	<th>Color</th>
	<th>Amount</th>
</tr>
<%
	while(rs.next()){
%>
<tr>
	<td><%=rs.getString(1)%></td>
	<td><%=rs.getString(2)%></td>
	<td><%=rs.getString(3)%></td>
	<td><%=rs.getString(4)%></td>
	<td><%=rs.getString(5)%></td>
	<td><%=rs.getString(6)%></td>
	<td><%=rs.getString(7)%></td>
	<td><%=rs.getString(8)%></td>
</tr>
<%
	}
}
else{
%>
<h4>Invalid order no <%=oid%></h4>
<%
}
%>

</article>
</body>
