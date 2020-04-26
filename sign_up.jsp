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

<jsp:include page="header.jsp"></jsp:include>
<form method="post" action="sign_up1.jsp" name='reg' onsubmit='return validate()'>
<br>
<table align='center' width='50%' style='border:1px solid red;background:#FF80CA;border-radius:8px;box-shadow:8px 8px 8px #888888;font-size:10pt;'>
<tr>
	<td colspan=2 align='center'><b>New User<b></td>
</tr>
<tr>
	<td><b>Email ID:</b></td>
	<td><input type='text' name='email' required></td>
</tr>
<tr>
	<td><b>Password:</b></td>
	<td><input type='password' name='pass' required></td>
</tr>
<tr>
	<td><b>Confirm Password:</b></td>
	<td><input type='password' name='cpass' required></td>
</tr>
<tr>
	<td><b>Full Name:</b></td>
	<td><input type='text' name='name' required></td>
</tr>
<tr>
	<td><b>Address:</b></td>
	<td><textarea rows=5 cols=40 name='addr' required></textarea></td>
</tr>
<tr>
	<td><b>Phone:</b></td>
	<td><input type='text' name='phone' required></td>
</tr>
<tr>	<td align='center'><input type='submit' value='SUBMIT' class='btn'></td>
	<td align='center'><input type='reset' value='RESET' class='btn'></td>
</tr>
</table>
</form>
