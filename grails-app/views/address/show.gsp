
<%@ page import="au.com.ts4impact.madcow.test.site.domain.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
    <div class="body">
        <ul class="breadcrumb">
            <li>
                <g:link class="list" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link> <span class="divider">|</span>
            </li>
            <li>
                <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
            </li>
        </ul>
            <g:if test="${flash.message}">
                <div class="alert alert-info"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
            </g:if>
            <form class="form-horizontal">
                <legend><g:message code="default.show.label" args="[entityName]" /></legend>
                <table>
                    <tbody>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="address.id.label" default="ID" /></td>
                            
                            <td valign="top" class="value" id="addressId">${fieldValue(bean: addressInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="address.addressLine1.label" default="Address Line 1" /></td>
                            
                            <td valign="top" class="value" id="addressLine1">${fieldValue(bean: addressInstance, field: "addressLine1")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="address.addressLine2.label" default="Address Line 2" /></td>
                            
                            <td valign="top" class="value" id="addressLine2">${fieldValue(bean: addressInstance, field: "addressLine2")}</td>
                            
                        </tr>                       
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="address.postCode.label" default="Post Code" /></td>
                            
                            <td valign="top" class="value" id="postCode"><g:link controller="postCodeReference" action="show" id="${addressInstance?.postCode?.id}">${addressInstance?.postCode?.postCode?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="address.state.label" default="State" /></td>
                            
                            <td valign="top" class="value" id="state"><g:link controller="state" action="show" id="${addressInstance?.postCode?.state?.id}">${addressInstance?.postCode?.state?.name?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="address.suburb.label" default="Suburb" /></td>
                            
                            <td valign="top" class="value" id="suburb">${fieldValue(bean: addressInstance, field: "postCode.locality")}</td>
                            
                        </tr>
                        
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="address.wirelessAccessPointDetected.label" default="Wireless Access Point Detected" /></td>                            
                            <td valign="top" class="value" id="wirelessAccessPointDetected">${fieldValue(bean: addressInstance, field: "wirelessAccessPointDetected")}</td>
                        </tr>                            
                        
                    
                    </tbody>
                </table>
            </form>
                <g:form class="form-horizontal" controller="Address">
                    <div class="form-actions">
                        <g:hiddenField class="" name="id" value="${addressInstance?.id}" />
                        <g:actionSubmit class="btn btn-primary" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" />
                        <g:actionSubmit action="delete" class="btn btn-danger" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"
                            value="Delete"><i class="icon-trash icon-white"></i></g:actionSubmit>
                        %{--<button type="submit" class="btn btn-danger" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">--}%
                            %{----}%
                            %{--Delete--}%
                        %{--</button>--}%
                    </div>
                </g:form>
        </div>
    </body>
</html>
