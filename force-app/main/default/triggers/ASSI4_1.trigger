trigger ASSI4_1 on Account(before delete, before insert, before update, after delete, after insert, after update) 
{
    if (Trigger.isBefore) 
    {
        if (Trigger.isInsert) {
            System.debug('before insert');
        }

        if (Trigger.isDelete) {
            System.debug('before delete');
        }

        if (Trigger.isUpdate) {
            System.debug('before update');
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
