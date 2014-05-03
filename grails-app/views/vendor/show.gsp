
<% if(session.user == null )
response.sendRedirect("${request.contextPath}/")
%>
<%@ page import="com.sky.district.domain.Vendor" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'vendor.label', default: 'Vendor')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
        <rateable:resources/>
    </head>
    <body >
      
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table >
                <tr>
                <td>
                <table style="border:0">
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="vendor.URL.label" default="URL" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: vendorInstance, field: "URL")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="vendor.address.label" default="Address" /></td>
                            
                            <td valign="top" class="value">${vendorInstance?.address?.encodeAsHTML()}</td>
                            
                            
                        </tr>
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="vendor.address.label" default="Contact Number" /></td>
                            
                            <td valign="top" class="value">${vendorInstance?.address?.phoneNumber.encodeAsHTML()}</td>
                            
                        </tr>
                        
                         <tr class="prop">
                            <td valign="top" class="name"><g:message code="vendor.address.label" default="Zip Code" /></td>
                            
                            <td valign="top" class="value">${vendorInstance?.address?.zip.encodeAsHTML()}</td>
                            
                        </tr>
                        
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="vendor.descrption.label" default="Descrption" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: vendorInstance, field: "descrption")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="vendor.name.label" default="Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: vendorInstance, field: "name")}</td>
                            
                        </tr>
                    
                       
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="vendor.vendorType.label" default="Vendor Type" /></td>
                            
                            <td valign="top" class="value"><g:link controller="vendorType" action="show" id="${vendorInstance?.vendorType?.id}">${vendorInstance?.vendorType?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
                </td>
                
                <td>
                <br/>
                            <g:if test="${vendorInstance.avatar}">
                             <br/>
  								<img class="avatar" src="${createLink(controller:'vendor', action:'avatar_image', id:vendorInstance.ident())}" />
							</g:if>
                            </td>
                </tr>
                </table>
               
            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${vendorInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
            <br/>
             <rateable:ratings bean='${vendorInstance}'/>
            <br/>
            <h1>Write Review:</h1>
            <br/>
            
             <div>
                <g:form>
               
                <g:textArea name="comments" value="" rows="5" cols="150" style='width: 70%; height: 160px;' />
                <br/>
                    <g:hiddenField name="id" value="${vendorInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="addComment" value="${message(code: 'default.button.postCmmnt.label', default: 'Post Comment')}" /></span>
                </g:form>
            </div>
           
            
            <h1>Reviews:</h1>
            <br/>
            
             <comments:each bean="${vendorInstance}">
             <table style="width:70%">
             <tr><td>
     			${comment.body} <br/><br/><strong>- Posted by ${comment.poster}
     			on 
     			<g:formatDate date="${comment.dateCreated }" format="MM/dd/yyyy"/>
     			</strong>
     			<br/>
     			</td></tr>
     			</table>
			</comments:each>
			 <br/> <br/>
        </div>
        <br/>
    </body>
</html>
