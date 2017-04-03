
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
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>               
        <div class="body">
            <h2><g:message code="default.search.label" args="[entityName]" /></h2>
            <g:if test="${flash.message}">
            <div class="alert alert-info">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${companyInstance}">
            <div class="alert alert-error">
                <g:renderErrors bean="${companyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="showSearchResults" method="post" >
                <div class="dialog">
                    <table id="searchTable">
                        <thead>
                            <tr>
                                <th><g:message code="address.addressLines.label" default="Address" /></th>
                                <th><g:message code="address.postCode.label" default="Post Code" /></th>
                                <th><g:message code="address.suburb.label" default="Suburb" /></th>
                                <th><g:message code="address.state.label" default="State" /></th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="prop">
                                
                                <td valign="top" class="value">
                                    <g:textField name="addressLines"/>
                                </td>                                                        
                            
                                <td valign="top" class="value">
                                    <g:textField name="postCode"/>
                                </td>                                                        
                            
                                <td valign="top" class="value">
                                    <g:textField name="suburb"/>
                                </td>                                                        
                            
                                <td valign="top" class="value">
                                    <g:select                                      
                                        from="${State.list().sort() {state -> state.name} }" 
                                        value="${state}" 
                                        name="state"
                                        optionKey="id"
                                        optionValue="name"
                                        noSelection="${['':'Select One...']}"/>
                                </td>
                            </tr> 
                                                                                  
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="list" type="submit" value="${message(code: 'default.button.search.label', default: 'Search')}" /></span>
                </div>                
            </g:form>
        </div>
    </body>
</html>
