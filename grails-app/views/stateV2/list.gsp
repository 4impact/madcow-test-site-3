
<%@ page import="au.com.ts4impact.madcow.test.site.domain.State" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'state.label', default: 'State')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-state" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-state" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="longName" title="${message(code: 'state.longName.label', default: 'Long Name')}" />
					
						<g:sortableColumn property="shortName" title="${message(code: 'state.shortName.label', default: 'Short Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${stateInstanceList}" status="i" var="stateInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${stateInstance.id}">${fieldValue(bean: stateInstance, field: "longName")}</g:link></td>
					
						<td>${fieldValue(bean: stateInstance, field: "shortName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${stateInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
