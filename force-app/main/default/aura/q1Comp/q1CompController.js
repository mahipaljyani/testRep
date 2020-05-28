({
    LoadList : function(component, event, helper) {
        var action = component.get("c.LoadAllAccountList"); 
        action.setCallback(this, function(a){
            var state = a.getState();
            if(state == 'SUCCESS') {
                var result = a.getReturnValue();
                component.set("v.acList", result);
            }
        });
        $A.enqueueAction(action);
    }
    
})