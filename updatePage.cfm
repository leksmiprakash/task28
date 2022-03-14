<html> 
    <head> 
        <title>Update Form</title> 
    </head> 
    <body> 
        <cfinvoke component="components.task28"  method="selectQuery" returnvariable="process" data="#URL.pageId#">
        <cfoutput query="process"> 
            <table> 
                <form action="updateAction.cfm" method="Post"> 
                    <input type="Hidden" name="pageId" value="#pageId#"><br> 
                    <tr> 
                        <td>Page Name:</td> 
                        <td><input type="text" name="pageName" value="#pageName#" required></td> 
                    </tr> 
                    <tr> 
                        <td>Page Description:</td> 
                        <td><input type="text" name="pageDesc" value="#pageDesc#" required></td> 
                    </tr> 
                    
                    <tr> 
                        <td>&nbsp;</td> 
                        <td><input type="Submit" name="formSubmit" value="Update Information"></td> 
                    </tr> 
                </form> 
            </table>            
        </cfoutput> 
    </body> 
</html>