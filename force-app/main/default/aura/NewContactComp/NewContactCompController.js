({
    getContactData : function(component, event, helper) {
        var conMail = component.get("v.conDetail.Email");
        console.log(conMail);
        var action = component.get("c.getDataFromAnotherORG");
        action.setParams({
            "Email": conMail
        });
        action.setCallback(this, function(a) {
            component.set("v.conDetail", a.getReturnValue());
            console.log(a.getReturnValue());
        });
        $A.enqueueAction(action);
    },
    handleSuccess : function(component, event, helper) {
        alert('ho gya');
    }
})