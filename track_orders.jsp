<body style='background:url(images/bg.jpg);background-repeat: no-repeat;background-size:100%;'>
<header>
	<jsp:include page="user_header.jsp"></jsp:include>
</header>

<article style='padding:30px;'>
<form method='post' action='show_order.jsp'>
<table style='background:linen;padding:20px;'>
<tr>
	<td><b>Order No:</b></td>
	<td><input type='text' name='oid' required></td>
	<td><input type='submit' value='Show'></td>
</tr>
</table>
</form>

</body>
