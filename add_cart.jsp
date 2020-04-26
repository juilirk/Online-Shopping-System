<body style='background:lightgrey;'>
<%@page import="java.sql.*,java.util.*"%>
<jsp:include page="user_home.jsp"></jsp:include>

<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	String type = request.getParameter("type");
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:clothing","postgres","");
	PreparedStatement ps = con.prepareStatement("select * from products where product_id=?");
	ps.setInt(1,pid);
	ResultSet rs = ps.executeQuery();
	rs.next();
%>
<form method='post' action='add_cart1.jsp'>
<table style='padding:15px;background:linen;' align='center'>
<tr>
	<td colspan=2 style='padding:15px;text-align:center;'>
		<img src='<%="images/"+rs.getInt(1)+".jpg"%>' width=400 height=400/><br>
		<p style='font-size:14pt;font-weight:bold;'><%=rs.getString(2)%></p>
		<p>Rs.<%=rs.getFloat(3)%>/-(-<%=rs.getInt(5)%>%)</p>
	</td>
</tr>
<tr>
	<td><b>Qty:</b></td><td><input type='text' name='qty' required></td>
</tr>
<tr>
	<td><b>Size:</b></td>
	<td>
	<select name='size' required>
	<option value=''>Select Size</option>
	<option value='S'>S</option>
	<option value='M'>M</option>
	<option value='L'>L</option>
	<option value='XL'>XL</option>
	<option value='XXL'>XXL</option>
	<option value='XXXL'>XXXL</option>
	</select>	
	</td>
</tr>
<tr>
	<td><b>Color:</b></td>
	<td>
	<select name='color' required>
	<option value=''>Select Color</option>
	<option value='White'>White</option>
	<option value='Black'>Black</option>
	<option value='Red'>Red</option>
	<option value='Green'>Green</option>
	<option value='Blue'>Blue</option>
	<option value='Orange'>Orange</option>
	<option value='Yellow'>Yellow</option>
	</select>
	</td>
</tr>
<tr>
	<td align='center'><input type='submit' value='ADD CART' class='btn'></td>
	<td align='center'><input type='reset' value='RESET' class='btn'></td>
</tr>
<input type='hidden' name='pid' value=<%=rs.getInt(1)%>>
<input type='hidden' name='type' value=<%=type%>>
</table>
</form>
</body>
