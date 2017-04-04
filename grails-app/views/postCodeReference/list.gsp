
<%@ page import="au.com.ts4impact.madcow.test.site.domain.PostCodeReference" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'postCodeReference.label', default: 'PostCodeReference')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
    <div class="body">
        <ul class="breadcrumb">
            <li>
                <g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link>
            </li>
        </ul>
        <form>
            <legend><g:message code="default.list.label" args="[entityName]" /></legend>
        </form>
        <g:if test="${flash.message}">
            <div class="alert alert-info"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
        </g:if>
			<table class="table table-bordered table-striped">
				<thead>
					<tr>
					
						<g:sortableColumn property="locality" title="${message(code: 'postCodeReference.locality.label', default: 'Locality')}" />
					
						<g:sortableColumn property="postCode" title="${message(code: 'postCodeReference.postCode.label', default: 'Post Code')}" />
					
                        <g:sortableColumn property="state.longName" title="${message(code: 'postCodeReference.state.label', default: 'State')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${postCodeReferenceInstanceList}" status="i" var="postCodeReferenceInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${postCodeReferenceInstance.id}">${fieldValue(bean: postCodeReferenceInstance, field: "locality")}</g:link></td>
					
						<td>${fieldValue(bean: postCodeReferenceInstance, field: "postCode")}</td>
					
						<td>${fieldValue(bean: postCodeReferenceInstance, field: "state")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<ul>
					<g:paginate total="${postCodeReferenceInstanceTotal}" max="50" />
				</ul>
			</div>
			<g:javascript>
				$( ".currentStep,.nextLink,.prevLink,.step" ).wrap( "<li></li>" );
			</g:javascript>
		</div>
	</body>
</html>
