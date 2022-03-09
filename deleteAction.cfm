<cfquery name="DeleteData" 
    datasource="task28"> 
        DELETE FROM pageTable 
        WHERE pageId = #URL.pageId# 
</cfquery> 
<h1>Page Deleted </h1> 
<cfoutput> 
    You have deleted the information
</cfoutput> 