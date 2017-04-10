<%@ page import="au.com.ts4impact.madcow.test.site.domain.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>

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
            <g:form action="save" class="form-horizontal">
                <legend><g:message code="default.create.label" args="[entityName]" /></legend>
                <fieldset>
                            <div class="control-group ${hasErrors(bean: addressInstance, field: 'addressLine1', 'errors')}">
                                <label class="control-label" for="addressLine1"><g:message code="address.addressLine1.label" default="Address Line 1" /></label>
                                <div class="controls">
                                    <g:textField name="addressLine1" required="true" value="${addressInstance?.addressLine1}" />
                                </div>
                            </div>
                        
                            <div class="control-group ${hasErrors(bean: addressInstance, field: 'addressLine2', 'errors')}">
                                <label class="control-label" for="addressLine2"><g:message code="address.addressLine2.label" default="Address Line 2" /></label>
                                <div class="controls">
                                    <g:textField name="addressLine2" value="${addressInstance?.addressLine2}" />
                                </div>
                            </div>
                        
                            <div class="control-group">
                                <label class="control-label" for="postCodeEntry"><g:message code="address.postCode.label" default="Post Code" /></label>
                                <div class="controls">
                                    <g:textField name="postCodeEntry" required="true" value=""/>
%{--                                         onchange="${remoteFunction(
                                            controller:'address', 
                                            action:'ajaxGetSuburbs',
                                            params:'\'id=\' + escape(this.value)',
                                            onLoading:'showSpinner(true);',
                                            onComplete:'updateSuburb(XMLHttpRequest);showSpinner(false);')}" /> --}%
                                </div>
                            </div>

                            %{--<g:javascript>--}%
                                %{--$('#postCodeEntry').change(function() {--}%
                                   %{--var request = $.ajax({--}%
                                        %{--url:'${g.createLink( controller:'address', action:'ajaxGetSuburbs')}',--}%
                                        %{--data: {id: $('#postCodeEntry').val()},--}%
                                        %{--dataType: 'json',--}%
                                        %{--success: updateSuburb,--}%
                                        %{--beforeSend: showSpinner,--}%
                                        %{--complete: showSpinner,--}%
                                        %{--error: showSpinner--}%
                                   %{--});--}%

                                %{--});--}%
                            %{--</g:javascript>--}%

                            %{--function go(){--}%
                            %{--  dataType: 'json'--}%
                            %{--$.ajax({ --}%
                            %{--url:'${g.createLink( controller:'address', action:'ajaxGetSuburbs', params:[id: this.value])}',--}%
                            %{--data:{ param1:param1 }--}%
                            %{--});--}%
                            %{--updateSuburb(XMLHttpRequest);--}%
                            %{--}--}%

                            %{--<input type="button" value="go!" onclick="go()"/>--}%
                            <div class="control-group">
                                <label class="control-label" for="suburbOptions"><g:message code="address.suburb.label" default="Suburb" /></label>
                                <div id="suburbOptions" class="controls"></div>
                            </div>

                            <div class="control-group ${hasErrors(bean: addressInstance, field: 'wirelessAccessPointDetected', 'errors')}">
                                <label class="control-label" for="wirelessAccessPointDetected"><g:message code="address.wirelessAccessPointDetected.label" default="Wireless Access Point Detected" /></label>
                                <div class="controls">
                                    <g:checkBox name="wirelessAccessPointDetected" value="${addressInstance?.wirelessAccessPointDetected}" />                                    
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="control-label">
                                </div>
                                <div class="controls">
                                    <span class="btn btn-info" id="checkForDuplicates">${message(code: 'address.create.button.CheckForDuplicates', default: 'Check For Duplicates')}</span>
                                    %{--                                     <g:submitToRemote class="btn btn-info"
                                                                                          name="checkForDuplicates"
                                                                                          value="${message(code: 'address.create.button.CheckForDuplicates', default: 'Check For Duplicates')}"
                                                                                          controller="address"
                                                                                          action="ajaxCheckForDuplicates"
                                                                                          onLoading="showSpinner(true);"
                                                                                          onComplete="showNumberOfDuplicates(XMLHttpRequest); showSpinner(false);"/> --}%
                                    <div class="spinner" id="spinner" style="display:none;">
                                        <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
                                    </div>
                                    <div class="warning" id="duplicatesMessage"></div>
                                </div>
                            </div>

                            %{--<g:javascript>--}%
                                %{--$('#checkForDuplicates').click(function() {--}%
                                   %{--$.ajax({--}%
                                        %{--url:'${g.createLink( controller:'address', action:'ajaxCheckForDuplicates')}',--}%
                                        %{--data: $("form").serializeArray(),--}%
                                        %{--dataType: 'json',--}%
                                        %{--success: showNumberOfDuplicates,--}%
                                        %{--beforeSend: function(xhr) {--}%
                                                        %{--clearNumberOfDuplicatesMessage();--}%
                                                        %{--showSpinner();--}%
                                                    %{--},--}%
                                        %{--complete: showSpinner,--}%
                                        %{--error: showSpinner--}%
                                   %{--});--}%

                                %{--});--}%
                            %{--</g:javascript>--}%

                <div class="form-actions">
                    <g:submitButton class="btn btn-primary" name="create" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    <g:link controller="Address" action="create" class="btn">Cancel</g:link>
                </div>
                </fieldset>
            </g:form>
        </div>
        <asset:script type="text/javascript">
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

            $('#postCodeEntry').change(function() {
                var request = $.ajax({
                    url:'${g.createLink( controller:'address', action:'ajaxGetSuburbs')}',
                    data: {id: $('#postCodeEntry').val()},
                    dataType: 'json',
                    success: updateSuburb,
                    beforeSend: showSpinner,
                    complete: showSpinner,
                    error: showSpinner
                });

            });
        </asset:script>
    </body>
</html>
