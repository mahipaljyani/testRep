({
    viewDetails : function(component, event, helper) {
        var myEvent = $A.get("e.c:ViewContact");
        myEvent.setParams({
            "conId" : event.target.id
        });
        ///alert('value '+event.target.id);
        myEvent.fire(); 
    },
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
    searchKeyChange: function(component, event) {
        var searchKey = event.getParam("conName");
        //alert(searchKey);
        var action = component.get("c.SearchContact");
        action.setParams({
            "conName": searchKey
        });
        action.setCallback(this, function(a) {
            //var list = a.getReturnValue();
            //console.log(list);
            component.set("v.allConList", a.getReturnValue());
        });
        $A.enqueueAction(action);
    }
})