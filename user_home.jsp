<body style='background:url(images/bg.jpg);background-repeat: no-repeat;background-size:100>
<header>
	<jsp:include page="user_header.jsp"></jsp:include>
</header>

<article style='padding:40px;'>
	<h1 align='center'>Welcome <%=session.getAttribute("uid")%></h1>
</article>

<footer>
	<jsp:include page="footer.jsp"></jsp:include>	
</footer>
</body>
