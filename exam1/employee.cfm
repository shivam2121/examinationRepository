<cfset variables.employees = new employees() />
<cfset variables.qEmployees = variables.employees.getEmployees() />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>
<cfinclude  template="menu.cfm">
<body>
    <cfoutput>
    <h1> Employee Salary Information </h1>
    <cfif structKeyExists(URL, "msg")>
        #URL.msg#
    </cfif>
    <form name="employeeform" action="employeeAction.cfm" method="post">
        <table border="1" width="100%">
            <tr>
                <td>
                    <label for="employeeId">employeeId:</label>
                </td>
                <td>
                    <select name="employeeId" id="employeeId">
                        <option value="">--Select Name--</option>
                        <cfloop query="#variables.qEmployees#">
                            <option value="#variables.qEmployees.id#">
                                #variables.qEmployees.firstname# #variables.qEmployees.lastname#
                            </option>
                        </cfloop>
                    </select>
                </td>
            </tr>
            <tr>
                <td>
                    <label for="Date">Date:</label>
                </td>
                <td>
                    <input type="text" name="date" />
                    Enter date in mm/dd/yyyy
                </td>               
            </tr>
            <tr>
                <td>
                    <label for="amount">Amount:</label>
                </td>
                <td>
                    <input type="text" name="amount" />
                </td>
            </tr>
            <tr>
                <td>
                    <label for="type">Type:</label>
                </td>
                <td>
                    <input type="radio" name="type" id="fullpaid" value="full paid">
                        <label for="fullpaid">Full paid</label>
                    <input type="radio" name="type" id="partialpaid" value="partial paid">
                        <label for="partialpaid">Partial paid</label>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" value="Submit" onclick="formValidate()">
                </td>
            </tr>
           
        </table>
         
        <script src="general-validate.js"></script> 
        <script src="validation.js"></script>             
    </form>
    <a href="sample.cfm">Error!</a>
    </cfoutput>
</body>
</html>