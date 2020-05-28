({
    AddRow : function(component, event, helper) {
        
        var inputs = component.get("v.OppList");
        var id = inputs.length+1;
        var obj = {};
        inputs.push(obj);
        component.set("v.OppList", inputs);
    },
    insertRecords : function(cmp, event, helper) {
        var listt = cmp.get("v.OppList");
        console.log('list : '+listt);
        var action = cmp.get("c.apexInsertRecord");
        action.setParams({ opList : listt });
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //alert("From server: " + response.getReturnValue());
            }
            else if (state === "INCOMPLETE") {
                // do something
            }
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
    }
})