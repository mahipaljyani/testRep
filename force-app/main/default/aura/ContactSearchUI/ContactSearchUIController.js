({
    LoadAllContacts : function(component, event, helper) {
        var action = component.get("c.LoadAllContactList"); 
        action.setCallback(this, function(a){
            var state = a.getState();
            if(state == 'SUCCESS') {
                var result = a.getReturnValue();
                component.set("v.allConList", result);
            }
        });
        $A.enqueueAction(action);
    },
    searchTextChange: function(component, event, helper) {
        var myEvent = $A.get("e.c:SearchText");
        myEvent.setParams({"conName": event.target.value});
        myEvent.fire();
        
    },
    
    performSearch: function(component, event) {
        //alert('onkect');
        var conName = event.getParam("conName");
        var action = component.get("c.SearchContact"); 
        action.setParams({"conName" : conName 
                         });
        action.setCallback(this, function(a){
            if(a.getState() == 'SUCCESS') {
                var result = a.getReturnValue();
                component.set("v.allConList", result);
                //console.log(component.get("v.allConList"));
            }
        });
        $A.enqueueAction(action);
    },
    viewContactEvent : function(component, event, helper) {
        var myEvent = $A.get("e.c:ViewContact");
        alert('value '+event.target.value);
        myEvent.setParams({"conId": event.target.value});
        myEvent.fire();
        alert("EventFired");
    },
    viewContactInfo : function(component, event) {
        alert('viewContactInfo called');
        var conId = event.getParam("conId");
        var action = component.get("c.ContactInfo"); 
        action.setParams({"id" : conId 
                         });
        action.setCallback(this, function(a){
            if(a.getState() == 'SUCCESS') {
                var result = a.getReturnValue();
                component.set("v.singleContact", result);
                //console.log(component.get("v.allConList"));
            }
        });
        $A.enqueueAction(action);
    },
    locationChange : function(component, event, helper) {
        var token = event.getParam("token");
        if (token.indexOf('contact/') === 0) 
        {
            var contactId = token.substr(token.indexOf('/') + 1);
            var action = component.get("c.ContactInfo"); 
            action.setParams({"id" : contactId });
            action.setCallback(this, function(a){
                var state = a.getState();
                if(a.getState() == 'SUCCESS') {
                    var result = a.getReturnValue();
                    component.set("v.singleContact", result);
                }
            });
            $A.enqueueAction(action);
        }
    }
    
})