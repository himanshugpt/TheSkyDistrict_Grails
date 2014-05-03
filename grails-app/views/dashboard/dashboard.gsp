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
			Welcome to Dashboard
		</title>
	</head>
	<body>
		
		<div class="body">
			<h1>Welcome to Dashboard..</h1>
			<br/>
			<div id="nav">
				<div class="homePagePanel">
					<div class="panelTop"></div>
					<div class="panelBody">
						<formset>
							<g:form action="results" controller="search">
								<g:textField name="tag" />
								<g:submitButton name="search" value="Search Coupons" />
							</g:form>
						</formset>
						<formset>
							<g:form action="vendorResults" controller="search">
								<g:textField name="vendorName" />
								<g:submitButton name="searchVendors" value="Search Vendors " />
							</g:form>
						</formset>
						<br/>
						<br/>
					</div>
					 <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
				</div>
			</div>

	
	</body>
</html>