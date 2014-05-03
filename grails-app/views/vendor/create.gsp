
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
<g:form action="save">
	<div class="dialog" style="width:25%;">
	<table width="30%" style="text-align:center;">
		<tbody>
		
		<tr class="prop">
				<td valign="top" class="name" style="text-align:right;"><label for="name"><g:message
					code="vendor.name.label" default="Name:*" /></label></td>
				<td valign="top" style="text-align:left;
					class="value ${hasErrors(bean: vendorInstance, field: 'name', 'errors')}">
				<g:textField name="name" value="${vendorInstance?.name}" /></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name" style="text-align:right;"><label for="URL"><g:message
					code="vendor.URL.label" default="URL:*" /></label></td>
				<td valign="top" style="text-align:left;
					class="value ${hasErrors(bean: vendorInstance, field: 'URL', 'errors')}">
				<g:textField name="URL" value="${vendorInstance?.URL}" /></td>
			</tr>


			<tr class="prop">
				<td valign="top" class="name" style="text-align:right;"><label for="descrption"><g:message
					code="vendor.descrption.label" default="Descrption:" /></label></td>
				<td valign="top" style="text-align:left;
					class="value ${hasErrors(bean: vendorInstance, field: 'descrption', 'errors')}">
				<g:textField name="descrption" value="${vendorInstance?.descrption}" />
				</td>
			</tr>

			

			<tr class="prop">
				<td class="name" style="text-align:right;"><label for="address"><g:message
					code="vendor.address.label" default="Address:" /></label></td>
				<td><g:textField name="address" style="text-align:left;
					value="${vendorInstance?.address?.address}" /></td>
			</tr>

			<tr class="prop">
				<td class="name" style="text-align:right;"><label for="phoneNumber"><g:message
					code="vendor.address.label" default="Contact Number:" /></label></td>
				<td><g:textField name="phoneNumber" style="text-align:left;
					value="${vendorInstance?.address?.address}" /></td>
			</tr>

			<tr class="prop">
				<td class="name" style="text-align:right;"><label for="Zip"><g:message
					code="vendor.address.label" default="Zip:*" /></label></td>
				<td><g:textField name="zip" style="text-align:left;
					value="${vendorInstance?.address?.address}" /></td>
			</tr>

			<tr class="prop">
				<td valign="top" class="name" style="text-align:right;"><label for="vendorType"><g:message
					code="vendor.vendorType.label" default="Vendor Type:" /></label></td>
				<td valign="top" style="text-align:left;
					class="value ${hasErrors(bean: vendorInstance, field: 'vendorType', 'errors')}">
				<g:select name="vendorType.id"
					from="${com.sky.district.domain.VendorType.list()}" optionKey="id"
					value="${vendorInstance?.vendorType?.id}" /></td>
			</tr>

		</tbody>
	</table>
	</div>
	<div class="buttons" style="width:10%"><span class="button"><g:submitButton
		name="create" class="save"
		value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
	</div>
</g:form>
</div>


</div>
</body>
</html>
