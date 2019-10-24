<cfcomponent>
    <cffunction  name="getEmployees" access="public" returntype="any" output="false">
        <cfargument  name="id" type="numeric">
        <cfset var qEmployee = "" />
        <cfquery name="qEmployee" datasource="#application.dsn#">
            select * from employees
            where 1 = 1
            <cfif arguments.id neq "">
                and id = <cfqueryparam value="#arguments.id#" cfsqltype="cf_sql_integer">
            </cfif>
        </cfquery>
        <cfreturn qEmployee>
    </cffunction>
</cfcomponent>