<%@page import="java.sql.*,java.text.*,java.util.*"%>
<%
	Class.forName("org.postgresql.Driver");
	Connection con = DriverManager.getConnection("jdbc:postgresql:clothing","postgres","");

	int oid = Integer.parseInt(request.getParameter("oid"));
	String odate = request.getParameter("odate");
	float amt = Float.parseFloat(request.getParameter("amt"));
	String mode = request.getParameter("mode");
	String cardno = request.getParameter("cardno");
	String bname = request.getParameter("bname");

	String eid = session.getAttribute("emaild").toString();

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date d = sdf.parse(odate);
	java.sql.Date new_odate = new java.sql.Date(d.getTime());

	PreparedStatement ps = con.prepareStatement("insert into order_master values(?,?,?,?,?,?,?,?)");
	ps.setInt(1,oid);
	ps.setDate(2,new_odate);
	ps.setFloat(3,amt);
	ps.setString(4,"Pending");
	ps.setString(5,mode);
	ps.setString(6,cardno);
	ps.setString(7,bname);
	ps.setString(8,eid);
	
	ps.executeUpdate();

	ps = con.prepareStatement("insert into order_details values(?,?,?,?,?)");

	Vector prodlist = (Vector)session.getAttribute("prodlist");

	for(int i=0;i<prodlist.size();i++){
		Vector rec = (Vector)prodlist.get(i);
		int pid = Integer.parseInt(rec.get(0).toString());
		int qty = Integer.parseInt(rec.get(1).toString());
		String size = rec.get(2).toString();
		String color = rec.get(3).toString();

		ps.setInt(1,pid);
		ps.setInt(2,oid);
		ps.setInt(3,qty);
		ps.setString(4,size);
		ps.setString(5,color);

		ps.executeUpdate();
	}
%>

<body style='background:url(images/bg.jpg);background-repeat: no-repeat;background-size:100%;'>
<header>
	<jsp:include page="user_header.jsp"></jsp:include>
</header>

<article style='padding:30px;'>

<h3>Your order is placed successfully.</h3>
<h4>Order No: <%=oid%></h4>
<h4>Your order will be delivered in next 3 working days.</h4>

<%
	session.removeAttribute("prodlist");
	session.removeAttribute("tot");
%>

</article>


</body>
	
	

