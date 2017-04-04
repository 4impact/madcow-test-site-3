
<%@ page import="au.com.ts4impact.madcow.test.site.domain.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <title><g:message code="default.search.results.label" args="[entityName]" /></title>        
    </head>
    <body>
        <div class="body">
            <ul class="breadcrumb">
                <li>
                    <g:link class="list" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link><span class="divider">|</span>
                </li>
                <li>
                    <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
                </li>
            </ul>
            <form>
            <legend><g:message code="default.search.results.label" args="[entityName]" /></legend>
            </form>
            <g:if test="${flash.message}">
                <div class="alert alert-info">${flash.message}</div>
            </g:if>
            <div class="list">
                <table id="searchResults" class="table table-bordered table-striped">
                    <thead>
                        <tr>
                            <g:sortableColumn property="id" title="ID" params="${params}"/>
                   	        <g:sortableColumn property="addressLine1" title="Address Line" params="${params}"/>
                   	        <g:sortableColumn property="postCode.locality" title="Suburb" params="${params}"/>
                   	        <g:sortableColumn property="postCode.state" title="State" params="${params}"/>
                   	        <g:sortableColumn property="postCode" title="Post Code" params="${params}"/>
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${addressInstanceList}" status="i" var="addressInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td><g:link action="show" id="${addressInstance.id}">${addressInstance.id}</g:link></td>                        
                            <td>${fieldValue(bean:addressInstance, field:'addressLine1')} ${fieldValue(bean:addressInstance, field:'addressLine2')}</td>
                            <td>${fieldValue(bean:addressInstance, field:'postCode.locality')}</td>
                            <td>${fieldValue(bean:addressInstance, field:'postCode.state.name')}</td>                        
                            <td>${fieldValue(bean:addressInstance, field:'postCode.postCode')}</td>                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="pagination">
                <ul>
                    <g:paginate total="${params.totalAddresses}" params="${params}"/>
                </ul>
            </div>
        </div>
    </body>
</html>
