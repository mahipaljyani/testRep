({
    restIdChange : function(component, event, helper) {
        var action = component.get("c.getData");
        console.log('vide details called');
        action.setParams({ 'RestId' : component.get("v.RestID") });
        action.setCallback(this, function(a){
            var state = a.getState();
            if(state == 'SUCCESS') {
                var result = a.getReturnValue();
                component.set("v.RestData", result);
                //console.log('Location :  ' + JSON.stringify(result.location));
                var RestLoc = [{
                    location : {
                        Latitude: result.location.latitude,
                        Longitude: result.location.longitude
                    },
                }];
                console.log(RestLoc);                
                component.set("v.RestLocData", RestLoc);
                
            }
        });
        $A.enqueueAction(action);
    }
})