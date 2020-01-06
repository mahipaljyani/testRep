trigger ACCOUNT_TRIGGER on Account(before delete, before insert, before update, after insert, after update, after delete) 
{
    if(trigger.isAfter)
    {
        if(trigger.isInsert)
        {
            Con_batch_class cbc = new Con_batch_class(trigger.new);
            Database.executeBatch(cbc,10);
        }
        if(trigger.isUpdate)
        {
            //Acnt_trigger_helper.Q1(trigger.new);
        }
        if(trigger.isDelete)
        {
         	
        }
    }
    if(trigger.isBefore)
    {
        if(trigger.isInsert)
        {
            //Acnt_batch_class bth = new Acnt_batch_class(trigger.new);
            //Database.executeBatch(bth,10);
        }
        if(trigger.isDelete){
            Acnt_trigger_helper.Q3(trigger.new);
        }
    }
}