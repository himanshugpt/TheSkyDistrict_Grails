

<%@ page import="com.sky.district.domain.Coupon" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'coupon.label', default: 'Coupon')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.create.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${couponInstance}">
            <div class="errors">
                <g:renderErrors bean="${couponInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="appProvider"><g:message code="coupon.appProvider.label" default="App Provider" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: couponInstance, field: 'appProvider', 'errors')}">
                                    <g:select name="appProvider.id" from="${com.sky.district.domain.ApplicationProvider.list()}" optionKey="id" value="${couponInstance?.appProvider?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="brand"><g:message code="coupon.brand.label" default="Brand" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: couponInstance, field: 'brand', 'errors')}">
                                    <g:select name="brand.id" from="${com.sky.district.domain.Brand.list()}" optionKey="id" value="${couponInstance?.brand?.id}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="liveDate"><g:message code="coupon.liveDate.label" default="Live Date" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: couponInstance, field: 'liveDate', 'errors')}">
                                    <g:datePicker name="liveDate" precision="day" value="${couponInstance?.liveDate}"  />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="messageRate"><g:message code="coupon.messageRate.label" default="Message Rate" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: couponInstance, field: 'messageRate', 'errors')}">
                                    <g:textField name="messageRate" value="${fieldValue(bean: couponInstance, field: 'messageRate')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="shortCode"><g:message code="coupon.shortCode.label" default="Short Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: couponInstance, field: 'shortCode', 'errors')}">
                                    <g:textField name="shortCode" value="${couponInstance?.shortCode}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
