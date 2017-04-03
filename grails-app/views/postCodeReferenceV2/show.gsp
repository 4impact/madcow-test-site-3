
<%@ page import="au.com.ts4impact.madcow.test.site.domain.PostCodeReference" %>
<!doctype html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'postCodeReference.label', default: 'PostCodeReference')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-postCodeReference" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-postCodeReference" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list postCodeReference">
			
				<g:if test="${postCodeReferenceInstance?.locality}">
				<li class="fieldcontain">
					<span id="locality-label" class="property-label"><g:message code="postCodeReference.locality.label" default="Locality" /></span>
					
						<span class="property-value" aria-labelledby="locality-label"><g:fieldValue bean="${postCodeReferenceInstance}" field="locality"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${postCodeReferenceInstance?.postCode}">
				<li class="fieldcontain">
					<span id="postCode-label" class="property-label"><g:message code="postCodeReference.postCode.label" default="Post Code" /></span>
					
						<span class="property-value" aria-labelledby="postCode-label"><g:fieldValue bean="${postCodeReferenceInstance}" field="postCode"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${postCodeReferenceInstance?.state}">
				<li class="fieldcontain">
					<span id="state-label" class="property-label"><g:message code="postCodeReference.state.label" default="State" /></span>
					
						<span class="property-value" aria-labelledby="state-label"><g:link controller="state" action="show" id="${postCodeReferenceInstance?.state?.id}">${postCodeReferenceInstance?.state?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${postCodeReferenceInstance?.id}" />
					<g:link class="edit" action="edit" id="${postCodeReferenceInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
