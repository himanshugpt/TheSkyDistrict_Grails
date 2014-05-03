<%
if(session.user == null)
response.sendRedirect("${request.contextPath}/")
 %>
<%@ page import="com.sky.district.domain.Coupon" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'coupon.label', default: 'Coupon')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
       
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            
            <div class="list">
            <div style="padding-bottom: 1em">
            Showing search results for keyword: <i>${session.tag}</i></div>
                <table>
                    <thead>
                        <tr>
                        
                            <th><g:message code="coupon.appProvider.label" default="App Provider" /></th>
                        
                            <th><g:message code="coupon.brand.label" default="Brand" /></th>
                            
                              <th><g:message code="coupon.brand.liveDate" default="Live Date" /></th>
                               <th><g:message code="coupon.brand.messageRate" default="Message Rate" /></th>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${session.couponInstanceList}" status="i" var="couponInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td>${fieldValue(bean: couponInstance, field: "appProvider")}</td>
                        
                            <td>${fieldValue(bean: couponInstance, field: "brand")}</td>
                            
                            <td><g:formatDate date="${couponInstance.liveDate}" format="MM/dd/yyyy"/></td>
                        
                            <td>${fieldValue(bean: couponInstance, field: "messageRate")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${session.couponInstanceTotal}" />
            </div>
            <br/>
            <g:form controller="auth">
  				<g:actionSubmit value="Search Again" action="dashboard"/>
			</g:form>
        </div>
    </body>
</html>
