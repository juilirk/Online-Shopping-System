<body bgcolor='cyan'>
<header>
<jsp:include page="header.jsp"></jsp:include>
</header>

<article style='padding:30px;'>
<form method='post' action='search1.jsp'>
<table align='center' style='background:linen;padding:20px;'>
<tr>
	<td style='padding:10px;'>
	<select name='gender'>
	<option value=''>Select Gender</option>
	<option value='Men'>Men</option>
	<option value='Women'>Women</option>
	</select>
	</td>

	<td style='padding:10px;'>
	<select name='type'>
	<option value=''>Select Type</option>
	<option value='Jeans'>Jeans</option>
	<option value='Shirts'>Shirts</option>
	<option value='Pants'>Pants</option>
	<option value='T-Shirt'>T-Shirts</option>
	<option value='Kurta'>Kurta</option>
	<option value='Hoodie'>Hoodie</option>
	</select>
	</td>

	<td style='padding:10px;'>
	<select name='brand'>
	<option value=''>Select Brand</option>
	<option value='NIKE'>NIKE</option>
	<option value='PUMA'>PUMA</option>
	<option value='REEBOK'>REEBOK</option>
	<option value='ADIDAS'>ADIDAS</option>
	<option value='MONTE CARLO'>MONTE CARLO</option>
	<option value='SABHYATA'>SABHYATA</option>
	<option value='BIBA'>BIBA</option>
	</select>
	</td>

	<td><input type='submit' value='Search'></td>
</tr>
</table>
</form>
</article>

<footer>
<jsp:include page="footer.jsp"></jsp:include>
</footer>
</body>
