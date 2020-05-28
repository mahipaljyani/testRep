({
    oppBlockChange : function(component, event, helper) {
        var curStatus = component.get('v.ShowOpp');
        if(curStatus != true){
            component.set('v.ShowOpp',true);
        }
        
        $A.enqueueAction(component.get('c.AddOppRow'));
    },
    conBlockChange : function(component, event, helper) {
        var curStatus = component.get('v.ShowContact');
        if(curStatus != true){
            component.set('v.ShowContact',true);
        }
        $A.enqueueAction(component.get('c.AddConRow'));
    },
    AddOppRow  : function(component, event, helper) {   
        var inputs = component.get("v.OppList");
        var obj = {};
        inputs.push(obj);
        component.set("v.OppList", inputs);
    },
    AddConRow  : function(component, event, helper) {   
        var inputs = component.get("v.ConList");
        var obj = {};
        inputs.push(obj);
        component.set("v.ConList", inputs);
    },
    SaveAll  : function(cmp, event, helper) {   
        var accountInfo = cmp.get("v.acDetail");
        var contactList = cmp.get("v.ConList");
        var opportunitiesList = cmp.get("v.OppList");
        console.log('acnt : ' + accountInfo);
        console.log('conList : ' + contactList);
        console.log('oppList : ' + opportunitiesList);
        
        var action = cmp.get("c.apexInsertRecord");
        action.setParams({ opList : opportunitiesList , conList : contactList , acc : accountInfo});
   
        
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //alert("From server: " + response.getReturnValue());
                alert('Records has beenSucessfully Created');
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