({
    LoadAllDetails : function(component, event, helper) {
        console.log('hey');
        var action = component.get('c.LoadAllClassList');
        action.setCallback(this, function(a){
            var state = a.getState();
            if(state == 'SUCCESS') {
                var result = a.getReturnValue();
                //component.set("v.allConList", result);
                console.log(result);
            }
        });
        $A.enqueueAction(action);
    }
})