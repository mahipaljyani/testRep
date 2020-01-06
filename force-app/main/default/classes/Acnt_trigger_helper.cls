public class Acnt_trigger_helper {
    public static void Q1(List<Account> a)
    {
        List<Opportunity> op_list = new List<Opportunity>();
        //List<Account> a = trigger.new;
        for(integer i = 0; i< a.size(); i++)
        {
            list<Opportunity> opls = [select id from Opportunity where accountid = :a[i].id]; 
            if(opls.size() <= 0)
            {
                Opportunity op = new Opportunity(Name='First Opportunity_'+a[i].Name, StageName = 'Open',CloseDate=Date.newInstance(2020,1,2));
                op.AccountId = a[i].id;
                op_list.add(op);
            } 
        }
        insert op_list;
    }
    public static void Q3(List<Account> acnt_lst)
    {
        List<Account_backup__c> ac_bck_lst = new List<Account_backup__c>();
        for(Account a : acnt_lst)
        {
            if(a.MasterRecordId != null)
            {
                Account_backup__c acnt_bckp = new Account_backup__c(Name = a.Name, Phone__c = a.Phone); 
                ac_bck_lst.add(acnt_bckp);
            }
        }
        Database.insert(ac_bck_lst);       
    }

}