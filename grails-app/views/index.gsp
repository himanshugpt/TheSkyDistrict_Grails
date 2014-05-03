<html>
<head>
<title>Welcome to Sky District</title>
<style type="text/css" media="screen">
#nav {
	margin-top: 90px;
	margin-left: 30px;
	width: 228px;
	float: right;
}

#register {
	margin-top: 20px;
	margin-left: 0px;
	margin-right: 0px;
	width: 228px;
	float: right;
	z-index: 10;
}

.message {
	background: #f3f8fc url(../images/skin/information.png) 8px 50%
		no-repeat;
	border: 1px solid #b2d1ff;
	color: #006dba;
	margin: 5px 0 5px 0;
	padding: 5px 5px 5px 5px
}

.homePagePanel * {
	margin: 0px;
}

.homePagePanel .panelBody ul {
	list-style-type: none;
	margin-bottom: 10px;
}

.homePagePanel .panelBody h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin-bottom: 10px;
}

.homePagePanel .panelBody {
	background: url(images/leftnav_midstretch.png) repeat-y top;
	margin: 0px;
	padding: 15px;
}

.homePagePanel .panelBtm {
	background: url(images/leftnav_btm.png) no-repeat top;
	height: 20px;
	margin: 0px;
}

.homePagePanel .panelTop {
	background: url(images/leftnav_top.png) no-repeat top;
	height: 11px;
	margin: 0px;
}

h2 {
	margin-top: 15px;
	margin-bottom: 15px;
	font-size: 1.2em;
}

#pageBody {
	margin-left: 50px;
}

a {
	font-family: Georgia, serif;
	font-size: small;
	font-weight: lighter;
}

a:link {
	color: black;
}

a:visited {
	color: #660066;
}

a:hover {
	text-decoration: none;
	color: #ff9900;
	font-weight: bold;
}

a:active {
	color: red;
	text-decoration: none
}

div.errors {
	background: #fff3f3;
	border: 1px solid red;
	color: #cc0000;
	margin: 10px 0 5px 0;
	padding: 5px;
}
</style>
<g:javascript library="application" />
</head>
<body>
<table width="70%" align="center">
	<tr>
		<td><img src="images/skyDistrict.png" height="400" width="700"
			style="margin-top: 70px; margin-left: 30px;" /></td>
		<td width="30%">
		<div id="nav" style="padding-left: 0; margin-left: 0"><g:if
			test="${flash.message}">
			<div class="message">
			${flash.message}
			</div>
		</g:if> <g:if test="${flash.errors}">
			<div class="errors">
			${flash.errors}
			</div>
		</g:if>
		<div class="homePagePanel" style="padding-left: 0; margin-left: 0">
		<div class="panelTop"></div>
		<div class="panelBody"><g:form name="login" action="login"
			controller="auth" autocomplete="off">
			<h1>Sign In</h1>
			<table>
				<tr>
					<td><g:message code="homepage.user.username"
						default="Username" /></td>
				</tr>
				<tr>
					<td><input type="text" size="20" name="username"
						style="width: 150px;" /></td>
				</tr>
				<tr>
					<td><g:message code="homepage.user.password"
						default="Password" /></td>
				</tr>
				<tr>
					<td><input type="password" size="20" name="password"
						style="width: 150px;" /></td>
				</tr>
			</table>

			<input style="margin-top: 10px; margin-left: 5px;" type="submit"
				class="btn" value="Sign In" />
			<modalbox:modalIncludes />
&nbsp;&nbsp;<span class="betaInvite"> <%session.showForm=true; %> <modalbox:createLink
				url="public/beta_invite.gsp" title="Request Beta Invite" width="400"
				linkname="Get Started Now" /> </span>
			<br />
		</g:form></div>
		<div class="panelBtm"></div>
		<!-- register panel starts frm here --> <!-- 
		
		 <g:form name="register"
			action="create" controller="user">
			<div id="register">
			<div class="homePagePanel">
			<div class="panelTop"></div>

			<div class="panelBody">
			<h1>Sign Up</h1>
			<input
				style="margin-top: 10px; margin-left: 5px; width: 80%; height: 30px;"
				type="submit" class="btn" value="Register" /> <br />
			</div>

			<div class="panelBtm"></div>
			</div>
			</div>
		</g:form> 
		 --> <!-- register panel ends here --></div>
		</div>
		</td>
	</tr>
</table>


</body>
</html>
