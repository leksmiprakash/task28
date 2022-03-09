<cfif NOT IsDefined ('session.userName')>
    <cflocation url="task28Login.cfm" addtoken="No">
</cfif>
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
        <div class="container">
	        <div class="row">
				<div class="col-md-12">
                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <a class="navbar-brand" href="#">Navbar</a>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                            <div class="navbar-nav">
                                <a class="nav-item nav-link active" href="#">Home</a>
                                <cfset role = #session.role#>
                                <cfif role eq "1">
                                    <a href="<cfoutput>task28AddPage.cfm</cfoutput>" class="nav-item nav-link" >Add Page</a><br>
                                    <a href="<cfoutput>task28Update.cfm</cfoutput>" class="nav-item nav-link" >View pages</a><br>
                                <cfelseif role eq "2">
                                    <a href="<cfoutput>task28AddPage.cfm</cfoutput>" class="nav-item nav-link" >Add Page</a><br>
                                    <a href="<cfoutput>task28Update.cfm</cfoutput>" class="nav-item nav-link" >View pages</a><br>
                                <cfelse>
                                    <cfquery name="pages" datasource="task28" result="r">
                                        SELECT * FROM pageTable
                                    </cfquery>
                                    <cfoutput query="pages">
                                        <a href="task28AViewPage.cfm?pageId=#pageId#" class="nav-item nav-link" >#pageName#</a><br>
                                    </cfoutput>
                                </cfif>
                                <a href="<cfoutput>task28Login.cfm</cfoutput>" class="nav-item nav-link" >Logout</a>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </body> 
</html>

