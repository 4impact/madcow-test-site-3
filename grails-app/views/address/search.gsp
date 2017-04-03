
<%@ page import="au.com.ts4impact.madcow.test.site.domain.Address" %>
<%@ page import="au.com.ts4impact.madcow.test.site.domain.AddressController" %>
<%@ page import="au.com.ts4impact.madcow.test.site.domain.State" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <title><g:message code="default.search.label" args="[entityName]" /></title>                
    </head>
    <body>
        <div class="body">
            <ul class="breadcrumb">

                <li>
                    <g:link class="create" action="create"><g:message code="default.create.label" args="[entityName]" /></g:link>
                </li>
            </ul>
            <g:if test="${flash.message}">
                <div class="alert alert-info"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${companyInstance}">
            <div class="alert alert-error">
                <g:renderErrors bean="${companyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="showSearchResults" method="post" class="form-horizontal">
                <legend><g:message code="default.search.label" args="[entityName]" /></legend>
                <fieldset>
                            <div class="control-group">
                                <label for="addressLines" class="control-label"><g:message code="address.addressLines.label" default="Address" /></label>
                                <div class="controls">
                                    <g:textField name="addressLines" class="input-large"/>
                                </div>
                            </div>
                            
                            <div class="control-group">
                                <label for="postCode" class="control-label"><g:message code="address.postCode.label" default="Post Code" /></label>
                                <div class="controls">
                                    <g:textField name="postCode" class="input-large"/>
                                </div>
                            </div>
                            
                            <div class="control-group">
                                <label for="suburb" class="control-label"><g:message code="address.suburb.label" default="Suburb" /></label>
                                <div class="controls">
                                    <g:textField name="suburb" class="input-large"/>
                                </div>
                            </div>
                            
                            <div class="control-group">
                                <label for="state" class="control-label"><g:message code="address.state.label" default="State" /></label>
                                <div class="controls">
                                    <g:select class="input-large"
                                        from="${State.list().sort() {state -> state.name} }"
                                        value="${state}" 
                                        name="state"
                                        optionKey="id"
                                        optionValue="name"
                                        noSelection="${['':'Select One...']}"/>
                                </div>
                            </div>

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <i class="icon-search icon-white">
                    </i>
                    ${message(code: 'default.button.search.label', default: 'Search')}
                </button>
                <button type="reset" class="btn">Cancel</button>
            </div>
            </fieldset>
            </g:form>
        </div>
    </body>
</html>
