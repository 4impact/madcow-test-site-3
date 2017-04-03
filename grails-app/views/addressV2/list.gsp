
<%@ page import="au.com.ts4impact.madcow.test.site.domain.Address" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-address" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-address" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="addressLine1" title="${message(code: 'address.addressLine1.label', default: 'Address Line1')}" />
					
						<g:sortableColumn property="addressLine2" title="${message(code: 'address.addressLine2.label', default: 'Address Line2')}" />
					
						<th><g:message code="address.postCode.label" default="Post Code" /></th>
					
						<g:sortableColumn property="wirelessAccessPointDetected" title="${message(code: 'address.wirelessAccessPointDetected.label', default: 'Wireless Access Point Detected')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${addressInstanceList}" status="i" var="addressInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${addressInstance.id}">${fieldValue(bean: addressInstance, field: "addressLine1")}</g:link></td>
					
						<td>${fieldValue(bean: addressInstance, field: "addressLine2")}</td>
					
						<td>${fieldValue(bean: addressInstance, field: "postCode")}</td>
					
						<td><g:formatBoolean boolean="${addressInstance.wirelessAccessPointDetected}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${addressInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
