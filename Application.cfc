
<cfcomponent>
<cfset This.name = "TestApplication">
<cfset This.clientmanagement="True">
<cfset This.loginstorage="Session">
<cfset This.sessionmanagement="True">
<cfset This.sessiontimeout="#createtimespan(0,0,10,0)#">
<cfset This.applicationtimeout="#createtimespan(5,0,0,0)#">
 
 <!--- if byLogin cookie is defined, set the session --->
<cfif isDefined("COOKIE.byLogin")>
	<cflock timeout="20" throwontimeout="No" type="EXCLUSIVE" scope="SESSION">
		<cfset SESSION.userName = listFirst(COOKIE.byLogin,":")>
		<cfset SESSION.password = listlast(COOKIE.byLogin,":")>
		<cfset SESSION.authenticated = "true">
	</cflock>
</cfif>
 
</cfcomponent>


