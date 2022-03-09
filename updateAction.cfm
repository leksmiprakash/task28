<cfquery name="UpdatePage" datasource="task28"> 
    UPDATE pageTable 
    SET pageName = '#Form.pageName#', 
    pageDesc = '#Form.pageDesc#'
    WHERE pageId = #Form.pageId# 
</cfquery> 
<cfoutput> Updated Successfully </cfoutput>
<cflocation url="./task28Update.cfm">