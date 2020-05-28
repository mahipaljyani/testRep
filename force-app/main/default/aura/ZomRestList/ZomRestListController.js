({
    
    setRestID : function(component, event, helper) {
        var restIdd = event.target.id;
        console.log("res id by  click ",restIdd);
        component.set("v.RestId",restIdd);
        console.log(component.get("v.RestId"));
    },
    getRestList : function(component, event, helper) {
        
            var action = component.get("c.getRestlist");
            action.setParams({ 'RestKeyword' : component.get("v.RestKeyword") });
            action.setCallback(this, function(a){
                var state = a.getState();
                if(state == 'SUCCESS') {
                    var result = a.getReturnValue();
                    console.log(JSON.stringify(result));
                    component.set("v.RestData", result);
                    console.log(result.restaurants[0].name);
                }
            });
            $A.enqueueAction(action);
            
        
    }
})