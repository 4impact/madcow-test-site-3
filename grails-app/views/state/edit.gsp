

<%@ page import="au.com.ts4impact.madcow.test.site.domain.State" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'state.label', default: 'State')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
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
            <g:if test="${flash.message}">
                <div class="alert alert-info"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${stateInstance}">
            <div class="alert alert-error">
                <g:renderErrors bean="${stateInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" class="form form-horizontal">
                <legend><g:message code="default.edit.label" args="[entityName]" /></legend>
                <g:hiddenField name="id" value="${stateInstance?.id}" />
                <g:hiddenField name="version" value="${stateInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="shortName"><g:message code="state.shortName.label" default="Short Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'shortName', 'errors')}">
                                    <g:textField name="shortName" value="${stateInstance?.shortName}" />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="longName"><g:message code="state.longName.label" default="Long Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: stateInstance, field: 'longName', 'errors')}">
                                    <g:textField name="longName" value="${stateInstance?.longName}" />
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="form-actions">
                    <span class="button"><g:actionSubmit class="btn btn-primary" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <g:form action="delete" controller="State">
                        <button class="btn btn-danger" type="submit" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" >
                            <i class="icon-trash icon-white"></i>
                            Delete
                        </button>
                        <g:hiddenField name="id" value="${stateInstance?.id}" />
                    </g:form>
                </div>
            </g:form>
        </div>
    </body>
</html>
