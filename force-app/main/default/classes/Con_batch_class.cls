global class Con_batch_class implements Database.Batchable<Account> 
{
    public List<Account> acc_list;
    public Con_batch_class(List<Account> acnt_list)
    {
        acc_list = acnt_list;
    }
    global List<Account> start(Database.BatchableContext BC){
        System.debug('acc_list' + acc_list );
        return acc_list;
    }
    
    global void execute(Database.BatchableContext BC, List<Account> acc_list){
        List<Contact> con_list = new List<Contact>();
        System.debug('Before acnt'+ acc_list);
        for(Account a : acc_list)
        {
            if(a.Contacts.size()<=0)
            {
                Contact con = new Contact(AccountId = a.Id, LastName = a.Name+' By TgBatch');
                con_list.add(con);
            }
        }
        System.debug('Contact '+ con_list );
        Database.insert(con_list);
    }
    
    global void finish(Database.BatchableContext BC){
    }
}