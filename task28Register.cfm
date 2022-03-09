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
            <form action="task28Register.cfm" method="post" enctype="multipart/form-data" > 
                <tr> 
                    <td>User Name</td> 
                    <td><input type="text" name="userName" maxlength="50" required></td> 
                </tr> 
                <tr> 
                    <td>Password</td> 
                    <td><input type="password" name="pwd" maxlength="50" required></td> 
                </tr>
                <tr> 
                    <td>Role</td> 
                    <td>
                        <select  name="role" required>
                            <option value="">-----</option>
                            <option value="1">Admin</option>
                            <option value="2">Editor</option>
                            <option value="3">User</option>
                        </select>
                    </td> 
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
                INSERT INTO users (userName,pwd,role)
                VALUES ('#Form.userName#', '#Form.pwd#', '#Form.role#') 
            </cfquery> 
            <cfoutput>Inserted Successfully</cfoutput>
        </cfif>
    </body> 
</html>
