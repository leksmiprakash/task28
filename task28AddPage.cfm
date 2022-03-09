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
        <table> 
            <form action="task28AddPage.cfm" method="post" enctype="multipart/form-data" > 
                <tr> 
                    <td>Page Name</td> 
                    <td><input type="text" name="pageName" maxlength="50" required></td> 
                </tr> 
                <tr> 
                    <td>Page Description</td> 
                    <td><textarea name="pageDesc" maxlength="50" required></textarea> </td> 
                </tr>
                <tr> 
                    <td>&nbsp;</td> 
                    <td><input type="Submit" value="Submit" name="formSubmit"></td> 
                </tr> 
            </form> 
            <!--- end html form ---> 
        </table> 
        <cfif StructKeyExists(Form,'formSubmit')>
           <cfquery name="AddUsers" datasource="task28"> 
                INSERT INTO pageTable (pageName,pageDesc)
                VALUES ('#Form.pageName#', '#Form.pageDesc#') 
            </cfquery> 
            <cfoutput>Inserted Successfully</cfoutput>
        </cfif>
    </body> 
</html>
