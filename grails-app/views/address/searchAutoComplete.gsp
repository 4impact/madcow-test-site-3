
<%@ page import="au.com.ts4impact.madcow.test.site.domain.PostCodeReference; au.com.ts4impact.madcow.test.site.domain.Address" %>
<%@ page import="au.com.ts4impact.madcow.test.site.domain.AddressController" %>
<%@ page import="au.com.ts4impact.madcow.test.site.domain.State" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'address.label', default: 'Address')}" />
        <title><g:message code="default.search.label" args="[entityName]" /></title>
<g:javascript>

            function outputArray(array)
            {
                var output = "";
                for (var i=0; i < array.length; i++)
                {
                    if (i===0)
                    {
                        //if start of array
                        output = output+ "[\""+array[i].locality+"\",";
                        continue;
                    }
                    if (i===array.length-1)
                    {
                        //if end of array
                        output = output+ "\"" + array[i].locality + "\"]";
                        continue;
                    }
                    //if not end of array
                    output = output+ "\"" + array[i].locality + "\",";
                }
                return output;
            }

            function printArray(element, index, array) {
                if (index===0)
                {
                    //if start of array
                    return "[\""+element+"\",";
                }
                if (index===array.length-1)
                {
                    //if end of array
                    return "\"" + element + "\"]";
                }
                //if not end of array
                return "\"" + element + "\",";
            }


		    function updateSuburbDataSource(e) { // The response comes back as a bunch-o-JSON
		        //console.log(e);
		        var postCodes = eval("(" + e.responseText + ")") // evaluate JSON

		        // get the typeAhead text box location
		        var typeAheadLocation = document.getElementById("suburb");

                if (postCodes)
                {
                    var list = new Array();
                    var output = "";
                    for (var i=0; i < postCodes.length; i++)
                    {
                        //adding the suburbs in
                        //list.push(postCodes[i].locality)
                        if (i===0)
                        {
                            //if start of array
                            output = output+ "[\""+postCodes[i].locality+"\",";
                            continue;
                        }
                        if (i===postCodes.length-1)
                        {
                            //if end of array
                            output = output+ "\"" + postCodes[i].locality + "\"]";
                            continue;
                        }
                        //if not end of array
                        output = output+ "\"" + postCodes[i].locality + "\",";

                    }
                    //var output = list.forEach(printArray);
                    //typeAheadLocation.dataset.source=output;
                    typeAheadLocation.data = output;
                    //$('suburb').typeahead(source=output);
                    //get all that data and return it
                    //typeAheadLocation.setAttribute("data-source",output);
                }
            }

</g:javascript>
    </head>
    <body>
        <div class="body">
            <ul class="breadcrumb">

                <li>
                    <g:link class="create" action="create"><g:message code="default.create.label" args="[entityName]" /></g:link>
                </li>
            </ul>
            <g:if test="${flash.message}">
                <div class="alert alert-info"><a class="close" data-dismiss="alert" href="#">×</a>${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${companyInstance}">
            <div class="alert alert-error">
                <g:renderErrors bean="${companyInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="showSearchResults" method="post" class="form-horizontal">
                <legend><g:message code="default.search.label" args="[entityName]" /></legend>
                <fieldset>
                            <div class="control-group">
                                <label for="addressLines" class="control-label"><g:message code="address.addressLines.label" default="Address" /></label>
                                <div class="controls">
                                    <g:textField name="addressLines" class="input-large"/>
                                </div>
                            </div>
                            
                            <div class="control-group">
                                <label for="postCode" class="control-label"><g:message code="address.postCode.label" default="Post Code" /></label>
                                <div class="controls">
                                    <g:textField name="postCode" class="input-large"/>
                                </div>
                            </div>
                            
                            <div class="control-group">
                                <label for="suburb" class="control-label"><g:message code="address.suburb.label" default="Suburb" /></label>
                                <div class="controls">
                                    <g:textField id="suburb"
                                                 name="suburb"
                                                 data-provide="typeahead"
                                                 class="input-large"
                                                 data-items="8"/>
                                </div>
                            </div>
                    %{--onkeydown="${remoteFunction(
                            controller:'address',
                            action:'ajaxGetSuburbNames',
                            params:'\'id=\' + escape(this.value)',
                            onComplete:'updateSuburbDataSource(XMLHttpRequest);')}"
                    data-source="${'["'}${State.list().join('","')}${'"]'}"--}%
                            <div class="control-group">
                                <label for="stateLongName" class="control-label"><g:message code="address.state.label" default="State" /></label>
                                <div class="controls">
                                    <g:textField id="stateLongName"
                                                 name="stateLongName"
                                                 data-provide="typeahead"
                                                 class="input-large"
                                                 data-source="${'["'}${State.list().join('","')}${'"]'}"
                                                 data-items="8"/>
                                </div>
                            </div>
                        %{--data-source="${'["bob","aust","dar"]'}"--}%
%{--                    onchange="${remoteFunction(
                            controller:'address',
                            action:'ajaxGetSuburbNames',
                            params:'\'id=\' + escape(this.value)',
                            onComplete:'updateSuburbDataSource(XMLHttpRequest);')}"--}%
                            %{--
                            <div class="control-group">
                                <label for="state" class="control-label"><g:message code="address.state.label" default="State" /></label>
                                <div class="controls">
                                    <g:select class="input-large"
                                        from="${State.list().sort() {state -> state.name} }"
                                        value="${state}" 
                                        name="state"
                                        optionKey="id"
                                        optionValue="name"
                                        noSelection="${['':'Select One...']}"/>
                                </div>
                            </div>
                            --}%

            <div class="form-actions">
                <button type="submit" class="btn btn-primary">
                    <i class="icon-search icon-white">
                    </i>
                    ${message(code: 'default.button.search.label', default: 'Search')}
                </button>
                <button type="reset" class="btn">Cancel</button>
            </div>
            </fieldset>
            </g:form>
        </div>
    </body>
</html>
