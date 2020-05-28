({
    doInit : function(cmp, event, helper) {
        var leadId = cmp.get("v.recordId");
        console.log('recordId : ' + leadId);
        var leadVal = cmp.get("v.LeadVal");
        var acVal = cmp.get("v.acDetail");
        var conVal = cmp.get("v.ConList");
        var oppVal = cmp.get("v.OppList");
        
        
        var action = cmp.get("c.getLeadDetails");
        action.setParams({ leadId : leadId});
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //alert("From server: " +  JSON.stringify(response.getReturnValue()));
                console.log("From server: " +  JSON.stringify(response.getReturnValue()));
                leadVal = response.getReturnValue();
                console.log('name ' + leadVal.Name);
                acVal.Name = leadVal.Name;
                conVal.FirstName = leadVal.FirstName;
                conVal.LastName = leadVal.LastName;
                conVal.Salutation = leadVal.Salutation;
                conVal.Title  = leadVal.Title ;
                
                oppVal.Name = leadVal.Name;
                 
                
                acVal.Email = leadVal.Email;
                conVal.Email = leadVal.Email;
                oppVal.Email = leadVal.Email;
                acVal.Phone = leadVal.Phone;
                conVal.Phone = leadVal.Phone;
                acVal.Website = leadVal.Website;
                oppVal.LeadSource = leadVal.LeadSource;
                
                cmp.set("v.acDetail",acVal);
                cmp.set("v.ConList",conVal);
                cmp.set("v.OppList",oppVal);
                cmp.set("v.LeadVal",leadVal);
            }
            else if (state === "INCOMPLETE") {
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
    },
    
    SaveAll  : function(cmp, event, helper) {   
        var leadVal = cmp.get("v.LeadVal");
        var accountInfo = cmp.get("v.acDetail");
        var contactList = cmp.get("v.ConList");
        var opportunitiesList = cmp.get("v.OppList");
        console.log('Lead : ' + JSON.stringify(leadVal));
        console.log('acnt : ' + JSON.stringify(accountInfo));
        console.log('conList : ' + JSON.stringify(contactList));
        console.log('oppList : ' + JSON.stringify(opportunitiesList));
        
        if(contactList.Salutation == null || contactList.Salutation == '' || contactList.FirstName == null ||  contactList.FirstName == '' || 
           contactList.LastName == '' || contactList.LastName == null || contactList.Title == '' || contactList.Title == null ||
           contactList.Phone == null || contactList.Phone == '' || contactList.Email  == '' || contactList.Email  == null ||
			accountInfo.Name == null || accountInfo.Name == '' || accountInfo.Type == null || accountInfo.Type == '' || accountInfo.Type == '--None--' || 
           accountInfo.Phone == null || accountInfo.Phone == '' || accountInfo.Website == null || accountInfo.Website == '' || 
           accountInfo.Industry == null || accountInfo.Industry == '' || accountInfo.Name == '--None' || 
           opportunitiesList.CloseDate == null  ||  opportunitiesList.CloseDate == '' || opportunitiesList.Name == null  ||  opportunitiesList.Name == '' ||
           opportunitiesList.StageName == null  ||  opportunitiesList.StageName == '' || opportunitiesList.StageName == '--None'  ||
           opportunitiesList.Amount == null  ||  opportunitiesList.Amount == '' ||
           opportunitiesList.LeadSource == null  ||  opportunitiesList.LeadSource == '' || opportunitiesList.LeadSource == '--None'
          ){
            //cmp.set("v.ErrorMessage","Plase fill");
            var toastEvent = $A.get("e.force:showToast");
            toastEvent.setParams({
                "title": "Error!",
                "type" : "error",
                "message": "Please Fill All the required fields."
            });
            toastEvent.fire();
        }else{
            
            var action = cmp.get("c.apexLeadConvert");
            action.setParams({ opList : opportunitiesList , conList : contactList , acc : accountInfo, leadValue : leadVal});
            
            action.setCallback(this, function(response) {
                var state = response.getState();
                if (state === "SUCCESS") {
                    //alert("From server: " + JSON.stringify(response.getReturnValue()));
                    
                    var toastEvent = $A.get("e.force:showToast");
                    toastEvent.setParams({
                        "title": "Success!",
                        "type" : "success",
                        "message": "Lead Successfully Converted."
                    });
                    toastEvent.fire();
                    
                    var navEvt = $A.get("e.force:navigateToSObject");
                    navEvt.setParams({
                        "recordId": response.getReturnValue(),
                        "slideDevName": "related"
                    });
                    navEvt.fire();
                    //window.open('https://mahijat-dev-ed.lightning.force.com/' + response.getReturnValue(),'');
                    //alert('Records has beenSucessfully Created');
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
    }
})