global class Acnt_batch_class implements Database.Batchable<sObject> 
{
    public static List<Account> acc_list;
    public Acnt_batch_class(List<Sobject> acnt_list)
    {
        acc_list = acnt_list;
    }
    global List<Account> start(Database.BatchableContext BC){
       //String query = 'select id, name from account';
       return acc_list;
   }

   global void execute(Database.BatchableContext BC, List<Account> acc_list){
       System.debug('Before llist: '+acc_list);
       for(account a : acc_list){
           a.name += 'batch';
       }
       System.debug('After List'+acc_list);
       Database.update(acc_list);
   }

   global void finish(Database.BatchableContext BC){
   }
}

/*
 * global class Acnt_batch_class implements Database.Batchable<sObject> 
{
    public static List<Account> acc_list;
    public Acnt_batch_class(List<Sobject> acnt_list)
    {
        acc_list = acnt_list;
    }
    global Database.QueryLocator start(Database.BatchableContext BC){
       String query = 'select id, name from account';
       return Database.getQueryLocator(query);
   }

   global void execute(Database.BatchableContext BC, List<Account> acc_list){
       System.debug('Before llist: '+acc_list);
       for(account a : acc_list){
           a.name += 'batch';
       }
       System.debug('After List'+acc_list);
       Database.update(acc_list);
   }

   global void finish(Database.BatchableContext BC){
   }
}
*/