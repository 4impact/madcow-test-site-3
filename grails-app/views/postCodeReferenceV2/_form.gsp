<%@ page import="au.com.ts4impact.madcow.test.site.domain.PostCodeReference" %>



<div class="fieldcontain ${hasErrors(bean: postCodeReferenceInstance, field: 'locality', 'error')} ">
	<label for="locality">
		<g:message code="postCodeReference.locality.label" default="Locality" />
		
	</label>
	<g:textField name="locality" value="${postCodeReferenceInstance?.locality}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: postCodeReferenceInstance, field: 'postCode', 'error')} ">
	<label for="postCode">
		<g:message code="postCodeReference.postCode.label" default="Post Code" />
		
	</label>
	<g:textField name="postCode" value="${postCodeReferenceInstance?.postCode}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: postCodeReferenceInstance, field: 'state', 'error')} required">
	<label for="state">
		<g:message code="postCodeReference.state.label" default="State" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="state" name="state.id" from="${au.com.ts4impact.madcow.test.site.domain.State.list()}" optionKey="id" required="" value="${postCodeReferenceInstance?.state?.id}" class="many-to-one"/>
</div>

