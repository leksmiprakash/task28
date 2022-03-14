<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="./css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <link href="./css/all.min.css" rel="stylesheet"/>
    </head>
    <body>
		<cflock scope="SESSION" timeout="20" throwontimeout="No" type="EXCLUSIVE">
			<cfparam name="Session.UserName" default="">
			<cfparam name="Session.Password" default="">
            <cfparam name="Session.role" default="">
		</cflock>
		<cfset sectionName="users">
		<cfset pgTitle="Log In">
		<cfset path="">
		<cfparam name="buttontext" default="Log In">
		<cfif not isDefined("login")>
			<cfset bodyTagVar="onLoad=""document.login.userName.focus();""">
		</cfif>
		<cfparam name="caption" type="string" default="Please Log In">
		<cfif isDefined("url.status")>
			<cfset caption = #URL.status#>
		</cfif>
		<cfif isDefined("URL.login")>
			<cfinvoke component="components.task28"  method="authUser" returnvariable="process">
    		</cfinvoke>  
		
			<cfif process.recordcount EQ 1>
				<cflock timeout="20" throwontimeout="No" type="EXCLUSIVE" scope="SESSION">
					<cfset SESSION.userName = URL.userName>
					<cfset SESSION.password = URL.password>
                    <cfset SESSION.role = URL.role>
					<cfset SESSION.authenticated = "true">
				</cflock>
				<meta http-equiv="Refresh" content="0; url=dashboard.cfm">
					<cfabort>
			<cfelse>
				<cflocation url="task28Login.cfm?status=failed" addtoken="No">
					<cfabort>
			</cfif>
		<cfelse>
			<cfif isDefined("URL.status") AND (status IS "logout")>
				<cfif isDefined("COOKIE.byLogin")>
					<cfif Len(COOKIE.byLogin) GT 0>
						<cfcookie name="byLogin" value="" expires="NOW">
					</cfif>
				</cfif>
				<cflock timeout="20" throwontimeout="No" type="EXCLUSIVE" scope="SESSION">
				<CFIF (ParameterExists(Session.authenticated))> 
					<CFSCRIPT> 
						StructClear(Session);
					</CFSCRIPT> 
				</CFIF>
				</cflock>
			</cfif>

			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<caption><cfif isDefined("URL.status") AND (status IS "failed")>
							<b class="error">Incorrect login.</b>
						<cfelseif isDefined("URL.status") AND (status IS "nousermatch")>
							<b class="error">Invalid username.</b>
						<cfelseif isDefined("URL.status") AND (status IS "error")>
							<b class="error"><cfoutput>#errorMessage# is empty.</cfoutput></b>
						<cfelseif isDefined("URL.status") AND (status IS "logout")>
							<cfif NOT isDefined("SESSION.userName")><b class="error">Logout Successful.</b></cfif>
						<cfelse>
							<b>Please Log In</b>
						</cfif></caption>
						<form action="<cfoutput>#CGI.script_name#</cfoutput>" method="get" name="login" id="login">
						<input type="hidden" name="login" value="true">
							<div class="form-group">
								<label>User Name</label>
								<td><input type="Text" name="userName" class="form-control" message="User Name is required" required="Yes" size="10" maxlength="12" id="userName"></td>
							</div>
							<div class="form-group">
								<label>Password</label>
								<input type="password" name="password" class="form-control" message="Password is required" required="Yes" size="10"  id="password">
							</div>
                            <div class="form-group">
								<label>Password</label>
								<select name="role" class="form-control"  required="Yes" s >
                                    <option value="">------------</option>
                                    <option value="1">Admin</option>
                                    <option value="2">Editor</option>
                                    <option value="3">Users</option>
							</div>
							<div class="form-group">
								<label> </label>
								<input type="submit" class="btn btn-success" value="<cfoutput>#buttontext#</cfoutput>">
							</div>
						</form>
					</div>
				</div>
			</div>
		</cfif>
	</body>
</html>