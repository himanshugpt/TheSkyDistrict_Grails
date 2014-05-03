
<% if(session.user == null || session.user?.role!='Admin' )
response.sendRedirect("${request.contextPath}/")
%>

<%@ page import="com.sky.district.domain.Vendor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'vendor.label', default: 'Vendor')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
       
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${vendorInstance}">
            <div class="errors">
                <g:renderErrors bean="${vendorInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${vendorInstance?.id}" />
                <g:hiddenField name="version" value="${vendorInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="URL"><g:message code="vendor.URL.label" default="URL" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendorInstance, field: 'URL', 'errors')}">
                                    <g:textField name="URL" value="${vendorInstance?.URL}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="address"><g:message code="vendor.address.label" default="Address" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendorInstance, field: 'address', 'errors')}">
                                    <g:select name="address.id" from="${com.sky.district.domain.Address.list()}" optionKey="id" value="${vendorInstance?.address?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="descrption"><g:message code="vendor.descrption.label" default="Descrption" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendorInstance, field: 'descrption', 'errors')}">
                                    <g:textField name="descrption" value="${vendorInstance?.descrption}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="vendor.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendorInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${vendorInstance?.name}" />
                                </td>
                            </tr>
                        
                            
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="vendorType"><g:message code="vendor.vendorType.label" default="Vendor Type" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: vendorInstance, field: 'vendorType', 'errors')}">
                                    <g:select name="vendorType.id" from="${com.sky.district.domain.VendorType.list()}" optionKey="id" value="${vendorInstance?.vendorType?.id}"  />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
