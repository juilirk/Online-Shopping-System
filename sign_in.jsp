<script type='text/javascript'>
function validate()
{
	x = document.forms["login"]["email"];

	if(!x.value.match(/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/))
	{
		alert("Invalid email id.");
		x.focus();
		return false;
	}

	return true;
}
</script>

<jsp:include page="header.jsp"></jsp:include>
<form method="post" action="sign_in1.jsp" name='login' onsubmit='return validate()'>
<br>
<table align='center' width='40%'  height=200 style='border:1px solid red;background:#FF80CA;border-radius:8px;box-shadow:8px 8px 8px #888888;font-size:10pt;'>
<tr>
	<td colspan=2 align='center'><b>Login<b></td>
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
	<td align='center'><input type='submit' value='SUBMIT' class='btn'></td>
	<td align='center'><input type='reset' value='RESET' class='btn'></td>
</tr>
<tr>
	<td align='center'><a href='sign_up.jsp' class='menu1'>New User</a></td>
	<td align='center'><a href='recover.jsp' class='menu1'>Forget Password?</a></td>
</tr>
</table>
</form>
