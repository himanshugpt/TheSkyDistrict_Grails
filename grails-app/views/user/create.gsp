<% if(session.user == null || session.user?.role!='Admin' )
response.sendRedirect("${request.contextPath}/")
%>
<%@ page import="com.sky.district.domain.User"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<meta name="layout" content="main" />
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title>
			<g:message code="default.create.label" args="[entityName]" />
		</title>
	</head>
	<body>
		<br />
		<div class="registerBody" align="center">
			<h1>
				<g:message code="user.register.label" args="[entityName]" />
			</h1>

			<div class="dialog" align="center" style="width:35%;">
				<g:if test="${flash.message}">
					<div class="message">
						${flash.message}
	</div>
				</g:if>
				<g:hasErrors bean="${userInstance}">
					<div class="errors" align="left">
						<g:renderErrors bean="${userInstance}" as="list" />
					</div>
				</g:hasErrors>
				<g:form action="save">
					<table width="30%" style="text-align:center;">
						<tbody>
							<tr class="prop">
								<td valign="top" class="name" style="text-align:right;">
									<label for="emailAddress">
										<g:message code="user.emailAddress.label" default="Email Address:*" />
									</label>
								</td>
								<td valign="top" style="text-align:left;"
									class="value ${hasErrors(bean: userInstance, field: 'emailAddress', 'errors')}">
									<g:textField name="emailAddress" value="${userInstance?.emailAddress}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name" style="text-align:right;">
									<label for="password">
										<g:message code="user.password.label" default="Password:*" />
									</label>
								</td>
								<td valign="top" style="text-align:left;"
									class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
									<input type="password" name="password" value="${userInstance?.password}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name" style="text-align:right;">
									<label for="password">
										<g:message code="user.confirm.password.label"
											default="Confirm Password:*" />
									</label>
								</td>
								<td valign="top" style="text-align:left;"
									class="value ${hasErrors(bean: userInstance, field: 'password', 'errors')}">
									<input type="password" name="conf_password" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name" style="text-align:right;">
									<label for="role">
										<g:message code="user.role.label"
											default="Role:*" />
									</label>
								</td>
								<td valign="top" style="text-align:left;"
									class="value ${hasErrors(bean: userInstance, field: 'role', 'errors')}">
									<g:select name="role" from="${['Business User', 'Admin','Vendor_User', 'Other']}" />
								</td>
							</tr>
							<tr class="prop">
								<td valign="top" class="name" style="text-align:right;">
									<label for="firstName">
										<g:message code="user.firstName.label" default="First Name:" />
									</label>
								</td>
								<td valign="top" style="text-align:left;"
									class="value ${hasErrors(bean: userInstance, field: 'firstName', 'errors')}">
									<g:textField name="firstName" value="${userInstance?.firstName}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name" style="text-align:right;">
									<label for="lastName">
										<g:message code="user.lastName.label" default="Last Name:" />
									</label>
								</td>
								<td valign="top" style="text-align:left;"
									class="value ${hasErrors(bean: userInstance, field: 'lastName', 'errors')}">
									<g:textField name="lastName" value="${userInstance?.lastName}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name" style="text-align:right;">
									<label for="phoneNumber">
										<g:message code="user.phoneNumber.label" default="Phone Number:" />
									</label>
								</td>
								<td valign="top" style="text-align:left;"
									class="value ${hasErrors(bean: userInstance, field: 'phoneNumber', 'errors')}">
									<g:textField name="phoneNumber"
										value="${fieldValue(bean: userInstance, field: 'phoneNumber')}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name" style="text-align:right;">
									<label for="address">
										<g:message code="user.address.label" default="Address:" />
									</label>
								</td>
								<td valign="top" style="text-align:left;"
									class="value ${hasErrors(bean: userInstance, field: 'address', 'errors')}">
									<g:textField name="address" value="${userInstance?.address}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name" style="text-align:right;">
									<label for="jobTitle">
										<g:message code="user.jobTitle.label" default="Job Title:" />
									</label>
								</td>
								<td valign=style= " text-align:left ;
									class="value ${hasErrors(bean: userInstance, field: 'jobTitle', 'errors')}">
									<g:textField name="jobTitle" value="${userInstance?.jobTitle}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name" style="text-align:right;">
									<label for="organizationName">
										<g:message code="user.organizationName.label"
											default="Organization Name:" />
									</label>
								</td>
								<td valign="top" style="text-align:left;"
									class="value ${hasErrors(bean: userInstance, field: 'organizationName', 'errors')}">
									<g:textField name="organizationName"
										value="${userInstance?.organizationName}" />
								</td>
							</tr>

							<tr class="prop">
								<td valign="top" class="name" style="text-align:right;">
									<label for="where_u_heard_about_us">
										<g:message code="user.where_u_heard_about_us.label"
											default="Where you heard about us?" />
									</label>
								</td>
								<td valign="top" style="text-align:left;"
									class="value ${hasErrors(bean: userInstance, field: 'where_u_heard_about_us', 'errors')}">
									<g:textField name="where_u_heard_about_us"
										value="${userInstance?.where_u_heard_about_us}" />
								</td>
							</tr>

						</tbody>
					</table>
			</div>
			<div class="buttons" style="width:10%">
				<span class="button">
					<g:submitButton name="create" class="save"
						value="${message(code: 'register.button.create.label', default: 'Register')}" />
				</span>
			</div>
		</g:form>
		</div>
	</body>
</html>