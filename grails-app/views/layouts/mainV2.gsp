<html>
    <head>
        <title><g:layoutTitle default="Address Book" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css',absolute:'true')}" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'madcow.css',absolute:'true')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'Address-Book.ico',absolute:'true')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
		<g:javascript library="prototype" />
        <g:javascript>
            function showSpinner(visible) {
                $('spinner').style.display = visible ? "inline" : "none";
            }

            Ajax.Responders.register({
                onLoading: function() {
                    showSpinner(true);
                },
                onComplete: function() {
                    if(!Ajax.activeRequestCount) showSpinner(false);
                }
            });
        </g:javascript>
    </head>
    <body>
        <table class="noborder">
            <tr>
            <td>
            <div id="addressBookLogo">
                <a name="madcowlogo" href="http://projectmadcow.com">
                    <img src="${resource(dir:'images',file:'madcow.jpg',absolute:'true')}" alt="Madcow" title="Madcow" border="0" />
                </a>
            </div>
            </td>
            <td style="vertical-align: middle;">
                <div class="spinner" id="spinner" style="display:none;">
                    <img src="${resource(dir:'images',file:'spinner.gif',absolute:'true')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
                </div>
            </td>
            </tr>
        </table>

        <g:layoutBody />

        <div id="footer" style="border: 0px; margin-top: 0px; margin-right: 10px;">
            <a href="http://4impact.com.au">
                <img src="${resource(dir:'images',file:'4impact.jpg',absolute:'true')}" alt="Madcow" title="Madcow" border="0" />
            </a>
        </div>
    </body>
</html>