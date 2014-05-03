
<%@ page import="com.sky.district.domain.Coupon" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'coupon.label', default: 'Coupon')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'coupon.id.label', default: 'Id')}" />
                        
                            <th><g:message code="coupon.appProvider.label" default="App Provider" /></th>
                        
                            <th><g:message code="coupon.brand.label" default="Brand" /></th>
                        
                            <g:sortableColumn property="liveDate" title="${message(code: 'coupon.liveDate.label', default: 'Live Date')}" />
                        
                            <g:sortableColumn property="messageRate" title="${message(code: 'coupon.messageRate.label', default: 'Message Rate')}" />
                        
                            <g:sortableColumn property="shortCode" title="${message(code: 'coupon.shortCode.label', default: 'Short Code')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${couponInstanceList}" status="i" var="couponInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${couponInstance.id}">${fieldValue(bean: couponInstance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: couponInstance, field: "appProvider")}</td>
                        
                            <td>${fieldValue(bean: couponInstance, field: "brand")}</td>
                        
                            <td><g:formatDate date="${couponInstance.liveDate}" /></td>
                        
                            <td>${fieldValue(bean: couponInstance, field: "messageRate")}</td>
                        
                            <td>${fieldValue(bean: couponInstance, field: "shortCode")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${couponInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
