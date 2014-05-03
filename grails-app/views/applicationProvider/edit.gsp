

<%@ page import="com.sky.district.domain.ApplicationProvider" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'applicationProvider.label', default: 'ApplicationProvider')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${applicationProviderInstance}">
            <div class="errors">
                <g:renderErrors bean="${applicationProviderInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${applicationProviderInstance?.id}" />
                <g:hiddenField name="version" value="${applicationProviderInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="coupons"><g:message code="applicationProvider.coupons.label" default="Coupons" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationProviderInstance, field: 'coupons', 'errors')}">
                                    
<ul>
<g:each in="${applicationProviderInstance?.coupons?}" var="c">
    <li><g:link controller="coupon" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="coupon" action="create" params="['applicationProvider.id': applicationProviderInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'coupon.label', default: 'Coupon')])}</g:link>

                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="name"><g:message code="applicationProvider.name.label" default="Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: applicationProviderInstance, field: 'name', 'errors')}">
                                    <g:textField name="name" value="${applicationProviderInstance?.name}" />
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
