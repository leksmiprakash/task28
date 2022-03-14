<cfcomponent displayname="Insert" hint="Insert Different string">
    <cffunction name="authUser" output="false" access="public" returnType="query">
        <cflock scope="session" timeout="20" type="readonly">
            <cfquery name="process" datasource="task28">
                SELECT userId
                FROM users
                WHERE (users.userName = '#trim(URL.userName)#' AND users.pwd = '#trim(URL.password)#')
            </cfquery>
        </cflock>
        <cfreturn process>
    </cffunction>

    <cfif IsDefined("form.registerSubmit")>
        <cffunction name="registerQuery" output="false" access="public">
            <cfquery name="regUsers" datasource="task28"> 
                INSERT INTO users (userName,pwd,role)
                VALUES ('#Form.userName#', '#Form.pwd#', '#Form.role#') 
            </cfquery> 
            <cfreturn>
        </cffunction>
    </cfif>

    <cfif IsDefined("form.insertSubmit")>
        <cffunction name="insertQuery" output="false" access="public">
            <cfquery name="AddUsers" datasource="task28"> 
                INSERT INTO pageTable (pageName,pageDesc)
                VALUES ('#Form.pageName#', '#Form.pageDesc#') 
            </cfquery> 
            <cfreturn>
        </cffunction>
    </cfif>

    <cffunction name="selectQuery" output="false" access="public" returnType="query">
        <cfargument name="data" type="any" required="false" />
        <cfset result = data>
        <cfquery name="GetRecord" datasource="task28"> 
            SELECT * FROM pageTable 
            WHERE pageId =  #result#
        </cfquery> 
        <cfreturn GetRecord>
    </cffunction>

    <cffunction name="getQuery" output="false" access="public" returnType="query">
        <cfquery name="selectQuery" datasource="task28" result="r">
            SELECT * FROM pageTable
        </cfquery>
        <cfreturn selectQuery>
    </cffunction>  

     <cfif IsDefined("form.updateSubmit")>
        <cffunction name="deleteQuery" output="false" access="public">
            <cfquery name="DeleteData" 
                datasource="task28"> 
                    DELETE FROM pageTable 
                    WHERE pageId = #URL.pageId# 
            </cfquery> 
            <cfreturn>
        </cffunction>
    </cfif>
</cfcomponent>
