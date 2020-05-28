({
    init: function (cmp) {
        var items = [];
        
        var action = cmp.get("c.getPicksVal");
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                alert(JSON.stringify(response.getReturnValue()));
                var responseVal = response.getReturnValue();
                for (var key in responseVal) {
                    if (responseVal.hasOwnProperty(key)) {
                        var item = {
                            "label": key,
                            "value": responseVal[key]
                        };
                        items.push(item);
                    }
                }
                cmp.set("v.options", items);
                //alert(JSON.stringify(items));
                
            }
            else if (state === "INCOMPLETE") {}
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }
        });
        $A.enqueueAction(action); 
        
        if(cmp.get('v.valuesStringFromFlow').toString() != '' || cmp.get('v.valuesStringFromFlow').toString() != undefined ) {
            var greetingValueArray = cmp.get('v.valuesStringFromFlow').toString().replace('[', '').replace(']', '').split(";");
            var valueOptionArray = [];
            for(var i = 0; i < greetingValueArray.length; i++) {
                valueOptionArray.push(greetingValueArray[i]);
            }
            cmp.set('v.values', valueOptionArray);
        }
    },
    
    handleChange: function (cmp, event) {
        var selectedOptionValue = event.getParam("value").toString();
        var valuesStringFromAuraInString = selectedOptionValue.split(',').join(';');
        cmp.set('v.valuesStringFromAura', valuesStringFromAuraInString);
    }
})