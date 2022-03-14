
<cfif NOT IsDefined ('session.userName')>
    <cflocation url="task28Login.cfm" addtoken="No">
</cfif>
<html> 
    <head> 
        <title>Page Details</title> 
    </head> 
    <body> 
        <cfinvoke component="components.task28"  method="selectQuery" returnvariable="process" data="#URL.pageId#">
        <cfoutput query="process"> 
                    <h2> #pageName#</h2> 
                    <p> #pageDesc# </p> 
        </cfoutput> 
        </body> 
</html>