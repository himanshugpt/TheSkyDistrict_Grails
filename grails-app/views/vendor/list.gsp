
<% if(session.user == null )
response.sendRedirect("${request.contextPath}/")
%>
<%@ page import="com.sky.district.domain.Vendor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'vendor.label', default: 'Vendor')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
       
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="name" title="${message(code: 'vendor.name.label', default: 'Name')}" />
                        
                            <g:sortableColumn property="URL" title="${message(code: 'vendor.URL.label', default: 'URL')}" />
                        
                            <th><g:message code="vendor.address.label" default="Address" /></th>
                        
                            <g:sortableColumn property="descrption" title="${message(code: 'vendor.descrption.label', default: 'Descrption')}" />
                        
                           
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${vendorInstanceList}" status="i" var="vendorInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                        	<td><g:link action="show" id="${vendorInstance.id}">${fieldValue(bean: vendorInstance, field: "name")}</g:link></td>
                        
                            <td>${fieldValue(bean: vendorInstance, field: "URL")}</td>
                        
                            <td>${fieldValue(bean: vendorInstance, field: "address")}</td>
                        
                            <td>${fieldValue(bean: vendorInstance, field: "descrption")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${vendorInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
