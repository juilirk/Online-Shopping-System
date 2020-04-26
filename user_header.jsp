<link rel='stylesheet' href="style.css">
<table width='100%' style='background:#FF06A2;'>
<tr>
	<td align='center' style='border:1px solid white;background:#888888;'><a href='' class='menu2'><%=session.getAttribute("uid")%></a></td>
	<td align='center'><a href='user_home.jsp' class='menu'>Home</a></td>
	<td align='center'><a href='disp_prod.jsp?type=Men' class='menu'>Men</a></td>
	<td align='center'><a href='disp_prod.jsp?type=Women' class='menu'>Women</a></td>
	<td align='center'><a href='edit_profile.jsp' class='menu'>Profile</a></td>
	<td align='center'><a href='view_cart.jsp' class='menu'>View Cart</a></td>
	<td align='center'><a href='track_orders.jsp' class='menu'>Track Order</a></td>
	<td align='center'><a href='logout.jsp' class='menu'>Logout</a></td>
</tr>
</table>
