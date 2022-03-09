<html> 
    <head> 
        <title>Page Details</title> 
    </head> 
    <body> 
        <cfquery name="GetRecordtoUpdate" datasource="task28"> 
            SELECT * FROM pageTable 
            WHERE pageId = #URL.pageId# 
        </cfquery> 
        <cfoutput query="GetRecordtoUpdate"> 
                    <h2> #pageName#</h2> 
                    <p> #pageDesc# </p> 
        </cfoutput> 
        </body> 
</html>