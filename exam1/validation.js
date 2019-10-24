function formValidate(){
    let frmEmployee = document.employeeform;

    if(!isSelected(frmEmployee.employeeId))
    {
        alert("select atleast one");
        return false;
    } 

    if(!isBlank(frmEmployee.date,"Date Can't Be Black"))
    {
        return false;
    }

    if(!isBlank(frmEmployee.amount,"Amount Can't Be Black"))
    {
        return false;
    }

    if(!isZero(frmEmployee.amount,"Amount Can't be Zero"))
    {
        return false;
    }

    if(!isChecked(frmEmployee.type))
    {
        alert("select atleast one");
        return false;
    } 
}