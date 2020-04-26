<%@page import="java.sql.*,java.text.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:clothing","postgres","");

	Statement s = con.createStatement();
	ResultSet rs = s.executeQuery("select count(*) from order_master");
	rs.next();
	int oid = rs.getInt(1)+1;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date d = new java.util.Date();
	String odate = sdf.format(d);

	float tot = Float.parseFloat(session.getAttribute("tot").toString());
%>

<body style='background:url(images/bg.jpg);background-repeat: no-repeat;background-size:100%;'>
<header>
	<jsp:include page="user_header.jsp"></jsp:include>
</header>

<article style='padding:30px;'>

<form method='post' action='checkout1.jsp'>
<table width='40%' height='40%' align='center' style='background:linen;'>
<tr>
	<td><b>Order ID:</b></td>
	<td><input type='text' name='oid' value=<%=oid%> readOnly></td>
</tr>
<tr>
	<td><b>Order Date:</b></td>
	<td><input type='text' name='odate' value=<%=odate%> readOnly></td>
</tr>
<tr>
	<td><b>Total Amount:</b></td>
	<td><input type='text' name='amt' value=<%=tot%> readOnly></td>
</tr>
<tr>
	<td><b>Pay Mode:</b></td>
	<td>
	<select name='mode' required>
	<option value=''>Select Payment Mode</option>
	<option value='COD'>Cash On Delivery</option>
	<option value='Card'>Credit Card</option>
	</select>
	</td>
</tr>
<tr>
	<td><b>Card No:</b></td>
	<td><input type='text' name='cardno'></td>
</tr>
<tr>
	<td><b>Bank Name:</b></td>
	<td><input type='text' name='bname'></td>
</tr>
<tr>
	<td align='center'><input type='submit' value='Pay Now'></td>
	<td align='center'><input type='reset' value='Clear'></td>
</tr>
</table>
</form>

</article>


</body>
	
	

