
<%@ page import="au.com.ts4impact.madcow.test.site.domain.PostCodeReference" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'postCodeReference.label', default: 'PostCodeReference')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-postCodeReference" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-postCodeReference" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="locality" title="${message(code: 'postCodeReference.locality.label', default: 'Locality')}" />
					
						<g:sortableColumn property="postCode" title="${message(code: 'postCodeReference.postCode.label', default: 'Post Code')}" />
					
						<th><g:message code="postCodeReference.state.label" default="State" /></th>
					
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
				<g:paginate total="${postCodeReferenceInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
