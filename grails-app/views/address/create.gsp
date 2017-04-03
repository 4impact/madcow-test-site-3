<%@ page import="au.com.ts4impact.madcow.test.site.domain.Address" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <title><g:message code="default.create.label" args="[entityName]" /></title>

        <g:javascript library="application" />
		<g:javascript>
		
		    function updateSuburb(e) { // The response comes back as a bunch-o-JSON
		        //console.log(e);
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
	
	                    //var objBreak = document.createElement("br");
	
	                    radioButtonLocation.appendChild(objLabel);
	                    //radioButtonLocation.appendChild(objBreak);
	        		}
                }
		    }

            //Clears the "Duplicate addresses found" message
		    function clearNumberOfDuplicatesMessage() {
		        var resultsDiv = document.getElementById("duplicatesMessage");
		        while (resultsDiv.firstChild) {
		            resultsDiv.removeChild(resultsDiv.firstChild);
		        }
		    }

		    function showNumberOfDuplicates(e) {
		        clearNumberOfDuplicatesMessage()
		        //parse the result into a string
		        var numberOfResults = eval("(" + e.responseText + ")");

                //Create a text node containing our message
		        var message = numberOfResults + " ${message(code: 'address.create.NumberOfDuplicates')}"
                //var message = "1 ${message(code: 'address.create.NumberOfDuplicates')}"
		        var messageNode = document.createTextNode(message);

		        //Append the message node in a <p> element
		        //var pElement = document.createElement("p");
		        //pElement.appendChild(messageNode);
		        var resultsDiv = document.getElementById("duplicatesMessage");
		        resultsDiv.appendChild(messageNode);
		    }


		</g:javascript>
        
    </head>
    <body>
        <div class="body">
            <ul class="breadcrumb">
                <li>
                    <g:link class="list" action="search"><g:message code="default.search.label" args="[entityName]" /></g:link>
                </li>
            </ul>
            <g:if test="${flash.message}">
                <div class="alert alert-info"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${addressInstance}">
            <div class="alert alert-error">
                <g:renderErrors bean="${addressInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" class="form-horizontal">
                <legend><g:message code="default.create.label" args="[entityName]" /></legend>
                <fieldset>
                            <div class="control-group ${hasErrors(bean: addressInstance, field: 'addressLine1', 'errors')}">
                                <label class="control-label" for="addressLine1"><g:message code="address.addressLine1.label" default="Address Line 1" /></label>
                                <div class="controls">
                                    <g:textField name="addressLine1" value="${addressInstance?.addressLine1}" />
                                </div>
                            </div>
                        
                            <div class="control-group ${hasErrors(bean: addressInstance, field: 'addressLine2', 'errors')}">
                                <label class="control-label" for="addressLine2"><g:message code="address.addressLine2.label" default="Address Line 2" /></label>
                                <div class="controls">
                                    <g:textField name="addressLine2" value="${addressInstance?.addressLine2}" />
                                </div>
                            </div>
                        
                            <div class="control-group">
                                <label class="control-label" for="postCodeEntry"><g:message code="address.postCode.label" default="Post Code" /></label>
                                <div class="controls">
                                    <g:textField name="postCodeEntry" />                                   
%{--                                         onchange="${remoteFunction(
                                            controller:'address', 
                                            action:'ajaxGetSuburbs',
                                            params:'\'id=\' + escape(this.value)',
                                            onLoading:'showSpinner(true);',
                                            onComplete:'updateSuburb(XMLHttpRequest);showSpinner(false);')}" /> --}%
                                </div>
                            </div>

%{--                             
                            <g:javascript>
                              function go(){
                                $.ajax({ 
                                  url:'${g.createLink( controller:'address', action:'ajaxGetSuburbs', params:'\'id=\' + escape(this.value)' 
                                  )}',
                                  data:{ param1:param1 }
                                });
                              }
                            </g:javascript>

                            <input type="button" value="go!" onclick="go()"/>
 --}%                            
                            <div class="control-group">
                                <label class="control-label" for="suburbOptions"><g:message code="address.suburb.label" default="Suburb" /></label>
                                <div id="suburbOptions" class="controls"></div>
                            </div>

                            <div class="control-group ${hasErrors(bean: addressInstance, field: 'wirelessAccessPointDetected', 'errors')}">
                                <label class="control-label" for="wirelessAccessPointDetected"><g:message code="address.wirelessAccessPointDetected.label" default="Wireless Access Point Detected" /></label>
                                <div class="controls">
                                    <g:checkBox name="wirelessAccessPointDetected" value="${addressInstance?.wirelessAccessPointDetected}" />                                    
                                </div>
                            </div>

                            <div class="control-group">
                                <div class="control-label">
                                </div>
                                <div class="controls">
%{--                                     <g:submitToRemote class="btn btn-info"
                                                      name="checkForDuplicates"
                                                      value="${message(code: 'address.create.button.CheckForDuplicates', default: 'Check For Duplicates')}"
                                                      controller="address"
                                                      action="ajaxCheckForDuplicates"
                                                      onLoading="showSpinner(true);"
                                                      onComplete="showNumberOfDuplicates(XMLHttpRequest); showSpinner(false);"/> --}%
                                    <div class="spinner" id="spinner" style="display:none;">
                                        <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
                                    </div>
                                    <div class="warning" id="duplicatesMessage"></div>
                                </div>
                            </div>

                <div class="form-actions">
                    <g:submitButton class="btn btn-primary" name="create" value="${message(code: 'default.button.create.label', default: 'Create')}" />
                    <g:link controller="Address" action="create" class="btn">Cancel</g:link>
                </div>
                </fieldset>
            </g:form>
        </div>
    </body>
</html>
