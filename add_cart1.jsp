<body style='background:lightgrey;'>
<%@page import="java.util.*"%>
<jsp:include page="user_home.jsp"></jsp:include>

<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	String type = request.getParameter("type");
	int qty = Integer.parseInt(request.getParameter("qty"));
	String size = request.getParameter("size");
	String color = request.getParameter("color");

	Vector rec = new Vector();
	rec.add(pid);
	rec.add(qty);
	rec.add(size);
	rec.add(color);

	Vector prodlist = (Vector)session.getAttribute("prodlist");

	if(prodlist==null)
		prodlist = new Vector();

	prodlist.add(rec);

	session.setAttribute("prodlist",prodlist);
%>
<h3>Product added to cart successfully.</h3>
<table width='60%'>
<tr>
	<td><a href='view_cart.jsp?type=<%=type%>' class='menu3'>View Cart</a></td>
	<td><a href='disp_prod.jsp?type=<%=type%>' class='menu3'>Continue Shopping</a></td>
	<td><a href='check_out.jsp' class='menu3'>Checkout</a></td>
</tr>
</table>
</body>
