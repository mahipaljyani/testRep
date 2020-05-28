({
    changeKeyword : function(component, event, helper) {
        alert('changekeyword called');
        var val = component.get("v.RestKeyword");
        component.set("v.RestKeyword",val);
    }
})