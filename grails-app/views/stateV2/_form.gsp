<%@ page import="au.com.ts4impact.madcow.test.site.domain.State" %>



<div class="fieldcontain ${hasErrors(bean: stateInstance, field: 'longName', 'error')} ">
	<label for="longName">
		<g:message code="state.longName.label" default="Long Name" />
		
	</label>
	<g:textField name="longName" value="${stateInstance?.longName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: stateInstance, field: 'shortName', 'error')} ">
	<label for="shortName">
		<g:message code="state.shortName.label" default="Short Name" />
		
	</label>
	<g:textField name="shortName" value="${stateInstance?.shortName}"/>
</div>

