<%@ page import="au.com.ts4impact.madcow.test.site.domain.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h2><g:message code="default.edit.label" args="[entityName]" /></h2>
            <g:if test="${flash.message}">
            <div class="alert alert-info">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${addressInstance}">
            <div class="alert alert-error">
                <g:renderErrors bean="${addressInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${addressInstance?.id}" />
                <g:hiddenField name="version" value="${addressInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="addressLine1"><g:message code="address.addressLine1.label" default="Address Line1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: addressInstance, field: 'addressLine1', 'errors')}">
                                    <g:textField name="addressLine1" value="${addressInstance?.addressLine1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="addressLine2"><g:message code="address.addressLine2.label" default="Address Line2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: addressInstance, field: 'addressLine2', 'errors')}">
                                    <g:textField name="addressLine2" value="${addressInstance?.addressLine2}" />
                                </td>
                            </tr>                        
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="postCode.id"><g:message code="address.postCode.label" default="Post Code" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: addressInstance, field: 'postCode', 'errors')}">
                                    <g:select name="postCode.id" from="${au.com.ts4impact.madcow.test.site.domain.PostCodeReference.list()}" optionKey="id" value="${addressInstance?.postCode?.id}"  />
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="wirelessAccessPointDetected"><g:message code="address.wirelessAccessPointDetected.label" default="Wireless Access Point Detected" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: addressInstance, field: 'wirelessAccessPointDetected', 'errors')}">
                                    <g:checkBox name="wirelessAccessPointDetected" value="${addressInstance?.wirelessAccessPointDetected}" />                                    
                                </td>
                            </tr>                            
                            
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>                
            </g:form>
        </div>
    </body>
</html>
