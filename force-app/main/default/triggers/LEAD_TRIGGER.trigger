trigger LEAD_TRIGGER on Lead (before delete, before insert, before update, after delete, after insert, after update) {
    if (Trigger.isBefore) 
    {
        if (Trigger.isInsert) {}

        if (Trigger.isDelete) {}

        if (Trigger.isUpdate) {} 
    }
    else if (Trigger.isAfter) 
    {
        if (Trigger.isInsert) {
            Lead_trigger_helper.Q6(trigger.new);
        }

        if (Trigger.isDelete) {
            System.debug('After delete');
        }

        if (Trigger.isUpdate) {
            System.debug('After update');
        } 
    }
    
}