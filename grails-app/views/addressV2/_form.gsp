<%@ page import="au.com.ts4impact.madcow.test.site.domain.Address" %>



<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'addressLine1', 'error')} ">
	<label for="addressLine1">
		<g:message code="address.addressLine1.label" default="Address Line1" />
		
	</label>
	<g:textField name="addressLine1" value="${addressInstance?.addressLine1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'addressLine2', 'error')} ">
	<label for="addressLine2">
		<g:message code="address.addressLine2.label" default="Address Line2" />
		
	</label>
	<g:textField name="addressLine2" value="${addressInstance?.addressLine2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'postCode', 'error')} required">
	<label for="postCode">
		<g:message code="address.postCode.label" default="Post Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="postCode" name="postCode.id" from="${au.com.ts4impact.madcow.test.site.domain.PostCodeReference.list()}" optionKey="id" required="" value="${addressInstance?.postCode?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'wirelessAccessPointDetected', 'error')} ">
	<label for="wirelessAccessPointDetected">
		<g:message code="address.wirelessAccessPointDetected.label" default="Wireless Access Point Detected" />
		
	</label>
	<g:checkBox name="wirelessAccessPointDetected" value="${addressInstance?.wirelessAccessPointDetected}" />
</div>

