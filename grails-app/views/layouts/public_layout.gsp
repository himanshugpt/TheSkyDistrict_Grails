<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="skyDistrictLogo"><a href="/theskydistrict">
        <img src="${resource(dir:'images',file:'skyDistrictLogo.png')}" alt="The Sky District" border="0" /></a></div>
        <g:layoutBody />
        <div id="ft">

</div>
    </body>
</html>