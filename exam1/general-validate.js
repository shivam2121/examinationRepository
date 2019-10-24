function isBlank(fieldObj,alertmsg)
{
    let fieldVal = fieldObj.value;
    if(fieldVal === "")
    {
        alert(alertmsg);
        fieldObj.focus();
        return false;
    }
    return true;
}

function isZero(fieldObj,alertmsg)
{
    let fieldVal = fieldObj.value;
    if(fieldVal === "0")
    {
        alert(alertmsg);
        fieldObj.focus();
        return false;
    }
    return true;
}

function isChecked(fieldObj)
{
    let checked = false;

    for(let i = 0;i < fieldObj.length;i++)
    {
        if(fieldObj[i].checked)
        {
            checked = true;
        }        
    }
    return checked;
}

function isSelected(fieldObj)
{
    let selected = false;

    for(let i = 0;i < fieldObj.length;i++)
    {
        if(fieldObj[i].selected)
        {
            selected = true;
        }        
    }
    return selected;
}