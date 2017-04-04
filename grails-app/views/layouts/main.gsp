<!doctype html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Address Book" /></title>
    <link rel="shortcut icon" href="${resource(dir:'images',file:'Address-Book.ico')}" type="image/x-icon" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <g:layoutHead />
    <asset:javascript src="application.js"/>
    <asset:stylesheet src="application.css"/>
    %{-- <g:javascript library="application" /> --}%
    %{-- <g:javascript library="prototype" /> --}%

    <!-- Latest compiled and minified CSS -->
    <!-- 3.3.7 bootstrap -->
    %{-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> --}%

    %{-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script> --}%

    <!-- 2.3.2 bootstrap -->
    <script src="https://maxcdn.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js" integrity="sha384-vOWIrgFbxIPzY09VArRHMsxned7WiY6hzIPtAIIeTFuii9y3Cr6HE6fcHXy5CFhc" crossorigin="anonymous"></script>

    <link href="https://maxcdn.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet" integrity="sha384-4FeI0trTH/PCsLWrGCD1mScoFu9Jf2NdknFdFoJhXZFwsvzZ3Bo5sAh7+zL8Xgnd" crossorigin="anonymous">

%{--     <g:javascript library="jquery" /> --}%
    <style type="text/css">
        @media screen,print {
            body {
                padding-top: 40px;
            }
        }

        .body {
            padding-top: 10px;
        }

    </style>
    <g:javascript>
        function showSpinner() {

            if ($('#spinner').css("display") === "none"){
                $('#spinner').css("display","inline");
            } else {
                $('#spinner').css("display","none");
            }

        }
    </g:javascript>
    <r:layoutResources/>
</head>
<body>
<g:render template="/layouts/navigation"/>
<div class="container">
            <g:layoutBody />
            <r:layoutResources/>

<div id="footer" style="border: 0px; margin-top: 10px; margin-right: 10px; float: right">
    <a href="http://4impact.com.au">
        <img src="${resource(dir:'images',file:'4impact.jpg')}" alt="Madcow" title="Madcow" border="0" />
    </a>
</div>
</div>
</body>
</html>