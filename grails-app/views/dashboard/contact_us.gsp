<%
if(session.user == null)
response.sendRedirect("${request.contextPath}/")
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />

<title>Contact Us</title>
</head>
<body>

<div class="body">
<h1>Contact Us</h1>

<br />
<div id="nav">
<div class="homePagePanel">
<div class="panelTop"></div>
<g:if test="${flash.message}">
	<div class="message">
	${flash.message}
	</div>
</g:if>
<div class="panelBody" style="width: 40%;">
<g:form	action="sendMail" controller="dashboard">
	<table style="border: none;">
		<tr>
			<td><label for="Subject">Subject</label></td>
			<td><g:textField name="Subject" style="width:60%"/></td>
		</tr>
		<tr>
			<td><label for="Message">Message</label></td>
			<td><g:textArea name="Message" /></td>
		</tr>
		<tr>
			<td></td>
			<td><g:submitButton name="Submit" value="Submit" /></td>
		</tr>
	</table>
</g:form> </div>
</div>
</div>
</body>
</html>