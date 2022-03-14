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
                <cfinvoke component="components.task28"  method="getQuery" returnvariable="selectQuery">
                <table class="table table-bordered"> 
                    <tr> 
                        <td align="center">Page Name</td> 
                        <td align="center">Page Description</td> 
                        <td align="center">Action</td> 
                    </tr> 
                    <cfoutput query="selectQuery">
                        <tr>
                            <td>#selectQuery.PageName#</td> 
                            <td>#selectQuery.pageDesc# </td> 
                            <td>
                                <button class="btn btn-warning"><a href="updatePage.cfm?pageId=#pageId#">Edit</a></button>
                                <button class="btn btn-danger"><a href="deleteAction.cfm?pageId=#pageId#" onclick="return confirm('Are you sure?');">Delete</a></button>
                            </td>
                        </tr> 
                    </cfoutput>
                </table>
            </div>
        </div>
    </body> 
</html>