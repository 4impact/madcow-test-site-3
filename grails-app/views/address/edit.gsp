<%@ page import="au.com.ts4impact.madcow.test.site.domain.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>

    </head>
    <body>
        <div class="body">
            <ul class="breadcrumb">

                <li>
                    <g:link class="list" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link>
                </li>
            </ul>
            <g:if test="${flash.message}">
                <div class="alert alert-info"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${addressInstance}">
            <div class="alert alert-error">
                <g:renderErrors bean="${addressInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="update" class="form-horizontal">
                <legend><g:message code="default.edit.label" args="[entityName]" /></legend>
                <fieldset>
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="addressLine1"><g:message code="address.addressLine1.label" default="Address Line 1" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: addressInstance, field: 'addressLine1', 'errors')}">
                                    <g:textField name="addressLine1" value="${addressInstance?.addressLine1}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="addressLine2"><g:message code="address.addressLine2.label" default="Address Line 2" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: addressInstance, field: 'addressLine2', 'errors')}">
                                    <g:textField name="addressLine2" value="${addressInstance?.addressLine2}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="postCodeEntry"><g:message code="address.postCode.label" default="Post Code" /></label>
                                </td>
                                <td valign="top" class="value">
                                    %{--<g:textField name="postCodeEntry" value=""/>--}%
                                    <g:textField name="postCodeEntry" id="postCodeEntry" value="${addressInstance?.postCode.postCode}"/>
                                    %{--<g:textField name="postCode" id="postCode" value="${addressInstance?.postCode.postCode}"--}%
                                        %{--onchange="${remoteFunction(--}%
                                            %{--controller:'address', --}%
                                            %{--action:'ajaxGetSuburbs',--}%
                                            %{--params:'\'id=\' + escape(this.value)',--}%
                                            %{--onLoading:'showSpinner(true);',--}%
                                            %{--onComplete:'updateSuburb(XMLHttpRequest);showSpinner(false);')}" />--}%
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="suburbOptions"><g:message code="address.suburb.label" default="Suburb" /></label>
                                </td>
                                <td id="suburbOptions">
                                    <label for="postCode.id">
                                        <input type="radio" name="postCode.id" id="${addressInstance?.postCode.postCode}" value="${addressInstance?.postCode.id}" checked="">${addressInstance?.postCode.locality}</label>
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
                        <tr class="prop">
                            <td valign="top" class="name">
                            </td>
                            <td valign="top">
                                <span class="btn btn-info" id="checkForDuplicates">${message(code: 'address.create.button.CheckForDuplicates', default: 'Check For Duplicates')}</span>
                                %{--<g:submitToRemote class="btn btn-info"--}%
                                                  %{--name="checkForDuplicates"--}%
                                                  %{--value="${message(code: 'address.create.button.CheckForDuplicates', default: 'Check For Duplicates')}"--}%
                                                  %{--controller="address"--}%
                                                  %{--action="ajaxCheckForDuplicates"--}%
                                                  %{--onLoading="showSpinner(true);"--}%
                                                  %{--onComplete="showNumberOfDuplicates(XMLHttpRequest); showSpinner(false);"/>--}%
                                <div class="spinner" id="spinner" style="display:none;">
                                    <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
                                </div>
                                <div valign="top" class="warning" id="duplicatesMessage"></div>
                            </td>
                        </tr>
                    </table>
                </div>

                <asset:script type="text/javascript">
                    var getPostCode = function() {
                           var request = $.ajax({
                                url:'${g.createLink( controller:'address', action:'ajaxGetSuburbs')}',
                                data: {id: $('#postCodeEntry').val()},
                                dataType: 'json',
                                success: updateSuburb,
                                beforeSend: showSpinner,
                                complete: showSpinner,
                                error: showSpinner
                           });
                    }
                    $('#postCodeEntry').change(getPostCode);
                    %{--$( document ).ready(getPostCode);--}%
                    $('#checkForDuplicates').click(function() {
                       $.ajax({
                            url:'${g.createLink( controller:'address', action:'ajaxCheckForDuplicates')}',
                            data: $("form").serializeArray(),
                            dataType: 'json',
                            success: showNumberOfDuplicates,
                            beforeSend: function(xhr) {
                                            clearNumberOfDuplicatesMessage();
                                            showSpinner();
                                        },
                            complete: showSpinner,
                            error: showSpinner
                       });

                    });
                </asset:script>

                <div class="form-actions">
                    <g:hiddenField class="" name="id" value="${addressInstance?.id}" />
                    <g:submitButton class="btn btn-primary" name="create" action="update" value="${message(code: 'default.button.update.label', default: 'Save changes')}" />
                    <g:link controller="Address" action="show" id="${addressInstance?.id}" class="btn">Cancel</g:link>
                </div>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
