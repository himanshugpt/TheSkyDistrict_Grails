
<% if(session.user == null || session.user?.role!='Admin' )
response.sendRedirect("${request.contextPath}/")
%>

<%@ page import="com.sky.district.domain.Vendor"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta name="layout" content="main" />
<g:set var="entityName"
	value="${message(code: 'vendor.label', default: 'Vendor')}" />
<title><g:message code="default.create.label"
	args="[entityName]" /></title>
</head>
<body>

<div class="body">

<div class="registerBody" align="center">
<br/>
<h1><g:message code="default.create.label" args="[entityName]" /></h1>
<g:if test="${flash.message}">
	<div class="message">
	${flash.message}
	</div>
</g:if> <g:hasErrors bean="${vendorInstance}">
	<div class="errors"><g:renderErrors bean="${vendorInstance}"
		as="list" /></div>
</g:hasErrors> 
<fieldset>
  <legend>Avatar Upload</legend>
  <g:form action="upload_avatar"  method="post"  enctype="multipart/form-data">
  <g:hiddenField name="id" value="${vendorInstance?.id}" />
    <label for="avatar">Avatar (16K)</label>
    <input type="file" name="avatar" id="avatar" />
    <div style="font-size:0.8em; margin: 1.0em;">
      For best results, your avatar should have a width-to-height ratio of 4:5.
      For example, if your image is 80 pixels wide, it should be 100 pixels high.
    </div>
    <input type="submit" class="buttons" value="Upload" />
  </g:form>
</fieldset>
</div>


</div>
</body>
</html>
