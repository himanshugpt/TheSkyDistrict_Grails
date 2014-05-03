<html>
    <head>
        <title><g:layoutTitle default="Grails" /></title>
        <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
        <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
        <g:layoutHead />
        <g:javascript library="application" />
    </head>
    <body >
    <div class="bodyframe">
    <table class="content" align="center">
    <tr><td>
        <div id="spinner" class="spinner" style="display:none;">
            <img src="${resource(dir:'images',file:'spinner.gif')}" alt="${message(code:'spinner.alt',default:'Loading...')}" />
        </div>
        <div id="skyDistrictLogo"><a href="/theskydistrict">
        <img src="${resource(dir:'images',file:'skyDistrictLogo.png')}" alt="The Sky District" border="0" /></a></div>
         <div class="nav">
            <span class="menuButton">
           		<a class="logout" href="${createLink(uri: '/auth/dashboard')}">
					<g:message code="default.home.label" default="Search" />
				</a>
				<a class="logout" href="${createLink(uri: '/auth/logout')}">
					<g:message code="default.Profile.label" default="Profile" />
				</a>
				<a class="logout" href="${createLink(uri: '/auth/logout')}">
					<g:message code="default.contactus.label" default="Contact Us" />
				</a>
				<a class="logout" href="${createLink(uri: '/auth/logout')}">
					<g:message code="default.faq.label" default="FAQ" />
				</a>
				<a class="logout" href="${createLink(uri: '/auth/logout')}">
					<g:message code="default.logout.label" default="Logout" />
				</a>
            </span>
        </div>
        <g:layoutBody />
        <div id="ft">

</div>
</td>
</tr>
</table>
</div>
    </body>
</html>