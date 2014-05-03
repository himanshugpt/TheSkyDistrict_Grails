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
         <div class="nav">
            <span class="menuButton">
           		<a class="logout" href="${createLink(uri: '/auth/dashboard')}">
					<g:message code="default.home.label" default="Search" />
				</a>
				<a class="logout" href="${createLink(uri: '/user/show/')}">
					<g:message code="default.Profile.label" default="Profile" />
				</a>
				<g:if test="${session.user.role=='Admin'}">
				<a class="logout" href="${createLink(uri: '/user/create')}">
					<g:message code="default.create_user.label" default="Create User" />
				</a>
				</g:if>
				
				<g:if test="${session.user.role=='Admin'}">
				<a class="logout" href="${createLink(uri: '/vendor/create')}">
					<g:message code="default.create_user.label" default="Create Vendor" />
				</a>
				</g:if>
				
				<a class="logout" href="${createLink(uri: '/vendor/list')}">
					<g:message code="default.create_user.label" default="List Vendors" />
				</a>
				
				<a class="logout" href="${createLink(uri: '/dashboard/contactus')}">
					<g:message code="default.contactus.label" default="Contact Us" />
				</a>
				<a class="logout" href="${createLink(uri: '/dashboard/faq')}">
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
    </body>
</html>