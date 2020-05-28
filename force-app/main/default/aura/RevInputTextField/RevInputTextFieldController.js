({
    setInputText : function(component, event, helper) {
        var a  = component.get('v.SearchTextValue');
        //console.log(a);
        var myEvent = $A.get("e.c:RevSearchTextEvent");
        myEvent.setParams({"conName": a});
        myEvent.fire();
    }
})