({
    checkboxChanged : function(component, event, helper) {
        var allOptionList  = component.get("v.options");
        allOptionList.forEach(function (item) {
            component.set("v."+item.value, false);
        })
        
        var checkList = component.get("v.value");
        checkList.forEach(function (item) {
            component.set("v."+item, true);
        })
    }
})