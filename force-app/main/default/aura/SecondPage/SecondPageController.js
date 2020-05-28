({
	myAction : function(component, event, helper) {
		var firstNum = component.get("v.first");
        var secondNum = component.get("v.Second");
        var res = parseInt(firstNum) + parseInt(secondNum);
        component.set("v.sum",res);
	}
})