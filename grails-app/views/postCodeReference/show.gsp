
<%@ page import="au.com.ts4impact.madcow.test.site.domain.PostCodeReference" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'postCodeReference.label', default: 'PostCodeReference')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <ul class="breadcrumb">
                <li>
                    <g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link> <span class="divider">|</span>
                </li>
                <li>
                    <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
                </li>
            </ul>
            <form><legend><g:message code="default.show.label" args="[entityName]" /></legend></form>
            <g:if test="${flash.message}">
                <div class="alert alert-info"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="postCodeReference.id.label" default="ID" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: postCodeReferenceInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="postCodeReference.locality.label" default="Locality" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: postCodeReferenceInstance, field: "locality")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="postCodeReference.postCode.label" default="Post Code" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: postCodeReferenceInstance, field: "postCode")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="postCodeReference.state.label" default="State" /></td>
                            
                            <td valign="top" class="value"><g:link controller="state" action="show" id="${postCodeReferenceInstance?.state?.id}">${postCodeReferenceInstance?.state?.name?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
                <g:form class="form-horizontal" controller="PostCodeReference" action="delete">
                    <div class="form-actions">
                        <g:hiddenField class="" name="id" value="${postCodeReferenceInstance?.id}" />
                        <g:actionSubmit class="btn btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                        <button type="submit" class="btn btn-danger" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
                            <i class="icon-trash icon-white"></i>
                            Delete
                        </button>
                    </div>
                </g:form>
        </div>
    </body>
</html>
