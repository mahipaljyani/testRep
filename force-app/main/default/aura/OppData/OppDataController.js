({
	myAction : function(component, event, helper) {
        var action = component.get("c.getOppList"); 
        action.setParams({"acntId" : component.get("v.recordId") 
        });
        action.setCallback(this, function(a){
            var state = a.getState();
            if(state == 'SUCCESS') {
                var result = a.getReturnValue();
                component.set("v.opplist", result);
                //Console.log(component.get("v.opplist"));
            }
        });
        $A.enqueueAction(action);
	}
})