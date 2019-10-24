<cfset variables.employees = new employees() />
<cfset variables.employeeSalary = new employeeSalary() />
<cfset variables.getEmployeeSalary =  variables.employeeSalary.getEmployeeSalary() />
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
    <button type="submit" name="button" onclick=window.location.href='employee.cfm'> Add Employee Salary</button>
    <br>
    <cfoutput>
    <table>
        <tr>
            <th>Name</th>
            <th>Salary Year</th>
            <th>Salary Month</th>
            <th>Amount</th>
            <th>Type</th>
        </tr>
        <cfloop query="#variables.getEmployeeSalary#">
        <cfset variables.qEmployees = variables.employees.getEmployees(id = variables.getEmployeeSalary.employeeId) />
        <tr>           
                <td>
                    <a href="employeeStats.cfm?employeeId=#variables.getEmployeeSalary.employeeId#" 
                       style="text-decoration:none;color:black" title="click to show status">
                        #variables.qEmployees.firstname# #variables.qEmployees.lastname# 
                    </a>
                </td>
                <td>
                    #dateFormat(#variables.getEmployeeSalary.date#,"yyyy")#
                </td>
                <td>
                    #dateFormat(#variables.getEmployeeSalary.date#,"mmm")#
                </td>
                <td>
                    #variables.getEmployeeSalary.amount#
                </td>
                <td>
                    #variables.getEmployeeSalary.type#
                </td> 
        </tr>    
        </cfloop>
    </table>
    </cfoutput>
</body>
</html>
