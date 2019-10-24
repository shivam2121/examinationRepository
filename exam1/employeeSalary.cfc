<cfcomponent displayname="employeesalary">
    <cffunction  name="insert" access="public" returntype="any" output="false">
        <cfargument  name="employeeId" required="true">
        <cfargument  name="date" required="true">
        <cfargument  name="amount" required="true">
        <cfargument  name="type" required="true">
        <cfquery datasource="#application.dsn#">
            insert into employeesalary(employeeid,date,amount,type)
            values(
                <cfqueryparam value="#arguments.employeeId#" cfsqltype="cf_sql_VARCHAR">,
                <cfqueryparam value="#arguments.date#" cfsqltype="cf_sql_DATE">,
                <cfqueryparam value="#arguments.amount#" cfsqltype="cf_sql_integer">,
                <cfqueryparam value="#arguments.type#" cfsqltype="cf_sql_VARCHAR">
            )
        </cfquery>
        <cfreturn />
    </cffunction>

    <cffunction  name="getEmployeeSalary" access="public" returntype="any" output="false">
        <cfargument  name="employeeId" default="">
        <cfset var qEmployee = "" />
        <cfquery name="qEmployee" datasource="#application.dsn#">
            select * from employeesalary
            where 1 = 1
            <cfif arguments.employeeId neq "">
                and employeeid = <cfqueryparam value="#arguments.employeeId#" cfsqltype="cf_sql_integer">
            </cfif>
            ORDER BY date DESC;
        </cfquery>
        <cfreturn qEmployee>
    </cffunction>

     <cffunction  name="getEmployeeSalaryStates" access="public" returntype="any" output="false">
        <cfargument  name="employeeid" type="numeric">
        <cfset var qEmployeeStats = "" />
        <cfquery name="qEmployeeStats" datasource="#application.dsn#">
            select id,SUM(amount) as "TotalPaid",count(id) as "TotalEntries",count(DISTINCT "date") as "Months",
            amount from employeesalary
            where  employeeid = <cfqueryparam value="#arguments.employeeid#" cfsqltype="cf_sql_integer">
        </cfquery>
        <cfreturn qEmployeeStats>
    </cffunction>

    <cffunction  name="getTotalMonths" access="public" returntype="any" output="false">
        <cfargument  name="employeeid" type="numeric">
        <cfset var qEmployeeStats = "" />
        <cfquery name="qEmployeeStats" datasource="#application.dsn#"> 
            select DISTINCT MONTHNAME(date),YEAR(date) as "year" , count(date) as "Months" from employeesalary
            where  employeeid = <cfqueryparam value="#arguments.employeeid#" cfsqltype="cf_sql_integer">
            group by date;    
        </cfquery>
        <cfreturn qEmployeeStats>
    </cffunction>

</cfcomponent>