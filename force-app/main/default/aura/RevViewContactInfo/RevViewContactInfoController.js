({
	viewContactInfo : function(component, event, helper) {
		var conId = event.getParam("conId");
        //alert(conId);
        component.set('v.contactId',conId);	
    }
})