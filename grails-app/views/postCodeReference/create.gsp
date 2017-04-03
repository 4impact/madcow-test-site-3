
<%@ page import="au.com.ts4impact.madcow.test.site.domain.PostCodeReference" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'postCodeReference.label', default: 'PostCodeReference')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <ul class="breadcrumb">
                <li>
                    <g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link>
                </li>
            </ul>
            <g:if test="${flash.message}">
                <div class="alert alert-info"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${postCodeReferenceInstance}">
            <div class="alert alert-error">
                <g:renderErrors bean="${postCodeReferenceInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" class="form-horizontal">
                <legend><g:message code="default.create.label" args="[entityName]" /></legend>
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="locality"><g:message code="postCodeReference.locality.label" default="Locality" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: postCodeReferenceInstance, field: 'locality', 'errors')}">
                                    <g:textField name="locality" value="${postCodeReferenceInstance?.locality}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="postCode"><g:message code="postCodeReference.postCode.label" default="Post Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: postCodeReferenceInstance, field: 'postCode', 'errors')}">
                                    <g:textField name="postCode" value="${postCodeReferenceInstance?.postCode}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="state.id"><g:message code="postCodeReference.state.label" default="State" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: postCodeReferenceInstance, field: 'state', 'errors')}">
                                    <g:select name="state.id"
                                              from="${au.com.ts4impact.madcow.test.site.domain.State.list() }"
                                              optionKey="id"
                                              value="${postCodeReferenceInstance?.state?.id}"
                                              noSelection="${['':'Select One...']}" />
                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="form-actions">
                    <g:submitButton class="btn btn-primary" name="create" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                </div>
            </g:form>
        </div>
    </body>
</html>
