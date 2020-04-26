<script type='text/javascript'>
function validate()
{
	x = document.forms["reg"]["email"];

	if(!x.value.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/))
	{
		alert("Invalid email id.");
		x.focus();
		return false;
	}

	x = document.forms["reg"]["pass"];
	y = document.forms["reg"]["cpass"];
	
	if(x.value!=y.value)
	{
		alert("Password and confirm password do not match.");
		x.focus();
		return false;
	}

	x = document.forms["reg"]["phone"];
	if(!x.value.match(/^\d{10}$/))
	{
		alert("Invalid phone number.");
		x.focus();
		return false;
	}

	
	return true;
}
</script>
<jsp:include page="user_home.jsp"></jsp:include>
<%@page import="java.sql.*,java.util.*"%>
<%
	String emaild = session.getAttribute("emaild").toString();
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:clothing","postgres","");
	PreparedStatement ps = con.prepareStatement("select * from users where emailid=?");
	ps.setString(1,emaild);
	ResultSet rs = ps.executeQuery();
	rs.next();
%>
<form method="post" action="edit_profile1.jsp" name='reg' onsubmit='return validate()'>
<br>
<table align='center' width='50%' style='border:1px solid red;background:#FF80CA;border-radius:8px;box-shadow:8px 8px 8px #888888;font-size:10pt;'>
<tr>
	<td colspan=2 align='center'><b>New User<b></td>
</tr>
<tr>
	<td><b>Email ID:</b></td>
	<td><input type='text' name='email' value='<%=rs.getString(1)%>' readOnly></td>
</tr>
<tr>
	<td><b>Password:</b></td>
	<td><input type='password' name='pass' value='<%=rs.getString(2)%>' required></td>
</tr>
<tr>
	<td><b>Full Name:</b></td>
	<td><input type='text' name='name' value='<%=rs.getString(3)%>' required></td>
</tr>
<tr>
	<td><b>Address:</b></td>
	<td><textarea rows=5 cols=40 name='addr' required><%=rs.getString(4)%></textarea></td>
</tr>
<tr>
	<td><b>Phone:</b></td>
	<td><input type='text' name='phone' value='<%=rs.getString(5)%>' required></td>
</tr>
<tr>	<td align='center'><input type='submit' value='EDIT' class='btn'></td>
	<td align='center'><input type='reset' value='RESET' class='btn'></td>
</tr>
</table>
</form>
