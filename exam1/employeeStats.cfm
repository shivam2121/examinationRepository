<cfquery name="variables.qList" datasource="#Application.dsn#">
select	 e.id employeeId,
			e.firstName,
            e.lastName,
            es.*
from 	shivamart.employees e
				inner join shivamart.employeeSalary es on es.employeeId = e.id
where	e.id = 1
</cfquery>

<cfset variables.paid = 0 />
<cfset variables.months = {} />
<cfloop query="variables.qList">
    <cfset variables.paid += variables.qList.amount />
    <cfset variables.months[year(variables.qList.date) & month(variables.qList.date)] = 1 />
</cfloop>

<cfset variables.employees = new employees() />
<cfset variables.employeeSalary = new employeeSalary()>
<cfset variables.getTotalEntries =  variables.employeeSalary.getEmployeeSalaryStates(employeeId = form.employeeId)>
<cfset variables.getSalary = variables.employeeSalary.getEmployeeSalary(employeeId = form.employeeId) />
<cfset variables.qEmployees = variables.employees.getEmployees(id = form.employeeId) />
<cfset variables.getTotalMonths = variables.employeeSalary.getTotalMonths(employeeId = form.employeeId) />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        table{
            border: 1px solid black;
            border-collapse:collapse;
        }
        tr th{
            border:1px solid black;
            padding:10px;          
        }
        tr td{
            border:1px solid black;
            padding:10px; 
        }
    </style>
</head>
<body>
    <cfinclude  template="menu.cfm">
    <cfoutput>
        Name : #variables.qList.firstname# #variables.qList.lastname#<br>
        Total Paid : #variables.paid#<br>
        Total Entries : #variables.qList.recordcount#<br>
        Total Months : #structCount(variables.months)#
        <table>
            <tr>
                <th>Salary Year</th>
                <th>Salary Month</th>
                <th>Amount</th>
            </tr>
            <cfloop query="#variables.getSalary#">
            <tr>           
                <td>
                    #dateFormat(#variables.getSalary.date#,"yyyy")#
                </td>
                <td>
                    #dateFormat(#variables.getSalary.date#,"mmmm")#
                </td>
                <td>
                    #variables.getSalary.amount#
                </td>
            </tr>
            </cfloop>  
        </table> 
    </cfoutput>
</body>
</html>
