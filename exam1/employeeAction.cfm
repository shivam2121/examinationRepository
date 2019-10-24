<cfdump  var="#form#">
<cfset variables.employeeSalary = new employeeSalary()>
<cfset variables.employeeSalary.insert(
employeeId = form.employeeId,
date = form.date,
amount = form.amount,
type = form.type
)>
<cflocation  url="employee.cfm?msg=Salary Data Added SuccessFully" addtoken="false">