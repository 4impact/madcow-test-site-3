<%@ page import="au.com.ts4impact.madcow.test.site.domain.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>
        
        <g:javascript library="application" />
		<g:javascript library="prototype" />
		<g:javascript>
		
		    function updateSuburb(e) { // The response comes back as a bunch-o-JSON
		    
		        var postCodes = eval("(" + e.responseText + ")") // evaluate JSON		    
		    
		        // remove existing radio buttons
		        var radioButtonLocation = document.getElementById("suburbOptions");
		        while (radioButtonLocation.lastChild){
		            radioButtonLocation.removeChild(radioButtonLocation.lastChild )
		        }    
		    
		        if (postCodes) { 

	                var radioButtonLocation = document.getElementById("suburbOptions");
	                for (var i=0; i < postCodes.length; i++) {
	                    var objRadItem = document.createElement("input");
	                    objRadItem.type = "radio";
	                    objRadItem.name = "postCode.id";
	                    objRadItem.id = postCodes[i].id;
	                    objRadItem.value = postCodes[i].id;
	                    
	                    if(i == 0) {objRadItem.defaultChecked = true; objRadItem.checked = true; };
	
	                    var objTextNode = document.createTextNode(" " + postCodes[i].locality);
	
	                    var objLabel = document.createElement("label");
	                    objLabel.htmlFor = objRadItem.id;
	                    objLabel.appendChild(objRadItem);
	                    objLabel.appendChild(objTextNode);
	
	                    var objBreak = document.createElement("br");
	
	                    radioButtonLocation.appendChild(objLabel);
	                    radioButtonLocation.appendChild(objBreak);
	        		}
                }
		    }
		
		</g:javascript>
        
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
            <span class="menuButton"><g:link class="list" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h2><g:message code="default.create.label" args="[entityName]" /></h2>
            <g:if test="${flash.message}">
            <div class="alert alert-info">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${addressInstance}">
            <div class="alert alert-error">
                <g:renderErrors bean="${addressInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" >
                <div class="dialog">
                    <table id="createTable">
                        <thead>
                            <tr>
                                <th><g:message code="address.addressLine1.label" default="Address Line 1" /></th>
                                <th><g:message code="address.addressLine2.label" default="Address Line 2" /></th>
                                <th><g:message code="address.postCode.label" default="Post Code" /></th>
                                <th><g:message code="address.suburb.label" default="Suburb" /></th>
                                <th><g:message code="address.wirelessAccessPointDetected.label" default="Wireless Access Point Detected" /></th>
                           </tr>
                        </thead>
                        <tbody>                        
                            <tr class="prop">
                                <td valign="top" class="value ${hasErrors(bean: addressInstance, field: 'addressLine1', 'errors')}">
                                    <g:textField name="addressLine1" value="${addressInstance?.addressLine1}" />
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: addressInstance, field: 'addressLine2', 'errors')}">
                                    <g:textField name="addressLine2" value="${addressInstance?.addressLine2}" />
                                </td>
                                <td valign="top" class="value">                                    
                                    <g:textField name="postCodeEntry"                                    
                                        onchange="${remoteFunction(
                                            controller:'address', 
                                            action:'ajaxGetSuburbs', 
                                            params:'\'id=\' + escape(this.value)', 
                                            onComplete:'updateSuburb(e)')}" />
                                </td>
                                <td id="suburbOptions"></td>                                
                                <td valign="top" class="value ${hasErrors(bean: addressInstance, field: 'wirelessAccessPointDetected', 'errors')}">
                                    <g:checkBox name="wirelessAccessPointDetected" value="${addressInstance?.wirelessAccessPointDetected}" />                                    
                                </td>
                            </tr>                            
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:submitButton name="createTableLayout" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
