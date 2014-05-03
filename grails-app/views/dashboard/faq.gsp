<%
if(session.user == null)
response.sendRedirect("${request.contextPath}/")
 %>
<%@ page import="com.sky.district.domain.Coupon" %>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<title>
			FAQ
		</title>
	</head>
	<body>
		
		<div class="body">
			<h1>FAQ coming soon..</h1>
			<br/>
			<div id="nav">
				<div class="homePagePanel">
					<div class="panelTop"></div>
					<div class="panelBody">
					</div>
					 <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
				</div>
			</div>

	
	</body>
</html>