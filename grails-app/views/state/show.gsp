
<%@ page import="au.com.ts4impact.madcow.test.site.domain.State" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'state.label', default: 'State')}" />
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
                            <td valign="top" class="name"><g:message code="state.id.label" default="ID" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: stateInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="state.shortName.label" default="Short Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: stateInstance, field: "shortName")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="state.longName.label" default="Long Name" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: stateInstance, field: "longName")}</td>
                            
                        </tr>
                    
                    </tbody>
                </table>
            </div>
            <g:form class="form-horizontal" controller="State">
                <div class="form-actions">
                    <g:hiddenField class="" name="id" value="${stateInstance?.id}" />
                    <g:actionSubmit class="btn btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                    <g:actionSubmit action="delete" class="btn btn-danger" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
                                    value="Delete"><i class="icon-trash icon-white"></i></g:actionSubmit>
                </div>
            </g:form>
        </div>
    </body>
</html>
