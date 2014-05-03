
<%@ page import="com.sky.district.domain.User" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
        <title><g:message code="user.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <h1><g:message code="user.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.emailAddress.label" default="Email Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "emailAddress")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.password.label" default="Password" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "password")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.phoneNumber.label" default="Phone Number" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "phoneNumber")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.address.label" default="Address" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "address")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.firstName.label" default="First Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "firstName")}</td>
                            
                        </tr>
                        
                     <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.lastName.label" default="Last Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "lastName")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.jobTitle.label" default="Job Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "jobTitle")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="user.organizationName.label" default="Organization Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: userInstance, field: "organizationName")}</td>
                            
                        </tr>
                    
                    
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${userInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
