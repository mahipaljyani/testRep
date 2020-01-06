trigger OpportunityTrigger on Opportunity(before delete, before insert, before update, after insert, after update, after delete) 
{
    if (Trigger.isBefore) 
    {
        if (Trigger.isInsert) {
            Oppt_trigger_helper.Q5_9(trigger.new);
        }
        
        if (Trigger.isDelete) {
            
        }    
        
        if (Trigger.isUpdate) {
            Oppt_trigger_helper.q8(trigger.new, trigger.old);        
            Oppt_trigger_helper.q7(trigger.new, trigger.old);
        } 
    }
    else if (Trigger.isAfter) 
    {
        if (Trigger.isInsert) {
            System.debug('After insert');
        }
        
        if (Trigger.isDelete) {
            System.debug('After delete');
        }
        
        if (Trigger.isUpdate) {
            System.debug('After update');
        } 
    }
}