//
// Created by tromano on 5/04/2017.
//
// Any JavaScript file within this directory can be referenced here using a relative path.

//= require jquery-2.1.3.js
//= require_self

function updateSuburb(data, status, xmlHttpRequest) { // The response comes back as a bunch-o-JSON
    //console.log(e);
    //var postCodes = eval("(" + data.responseText + ")") // evaluate JSON
    var postCodes = data;
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

function showNumberOfDuplicates(data, status, xmlHttpRequest) {
    clearNumberOfDuplicatesMessage()
    //parse the result into a string
    //var numberOfResults = eval("(" + e.responseText + ")");
    var numberOfResults = data;

    //Create a text node containing our message
    var message = numberOfResults + " duplicate addresses found"
    //var message = "1 ${message(code: 'address.create.NumberOfDuplicates')}"
    var messageNode = document.createTextNode(message);

    //Append the message node in a <p> element
    //var pElement = document.createElement("p");
    //pElement.appendChild(messageNode);
    var resultsDiv = document.getElementById("duplicatesMessage");
    resultsDiv.appendChild(messageNode);
}