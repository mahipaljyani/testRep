public class Oppt_trigger_helper {
    public static integer flag=0;
    
    public static void Q5_9(List<Opportunity> op_lst)
    {
        //List<Opportunity> op_lst = trigger.new;
        List<Account> acnt_list = new list<Account>();
        for(Opportunity op : op_lst)
        {
            if(op.AccountId != null){
                List<String> stageName = new List<String>{'Closed Lost','Closed Won'};
                //String query = 'select count(id) from Opportunity where AccountId = \' '+ op.AccountId + '\' AND StageName NOT IN {'+ 'Closed Lost'+',' + 'Closed Won' +'}';
                String query = 'select count() from Opportunity where AccountId = \''+ op.AccountId + '\' AND StageName NOT IN (\'Closed Lost\',\'Closed Won\')';
                //System.debug(query);
                integer open_opt_count = Database.countQuery(query);
                //System.debug('count '+open_opt_count);
                if(open_opt_count>=2)
                {
                    op.addError('You Cannot add add more opportunity if there are two open avail :(');
                }else{
                    if(op.amount>10000)
                    {
                        Account a = new Account(id=op.AccountId,Rating='Hot',CustomerPriority__c = 'High');
                        acnt_list.add(a);
                    }
                }
            }else{
                Trigger.oldMap.get(op.Id).addError('You Cannot add any opportunity without account relation');
            }
        }
        update acnt_list;
    }
    
    public static void Q7(list<Opportunity> new_op_list, list<Opportunity> old_op_list )
    {
        list<Opportunity> op_backup = new List<Opportunity>();
        if(flag==1)
        {
            for(Opportunity op : old_op_list)
            {
                Opportunity opNew = new Opportunity();
                opnew = op.clone();	
                opNew.name += '_Backup'; 
                op_backup.add(opNew);
            }
            insert(op_backup);
        }    
    }
    
    public static void Q8(list<Opportunity> new_op_list, list<Opportunity> old_op_list)
    {
        //   list<Opportunity> old_op_list = trigger.old;
        //  list<Opportunity> new_op_list = trigger.new;
        
        List<Task> ltask1 = new List<Task>();
        //sYSTEM.debug(old_op_list);
        //System.debug(new_op_list);
        flag = 0;
        for(Opportunity opN : new_op_list)
        {	
            System.debug('Stage : '+opN.StageName);
            if(opN.StageName != 'Closed Won' || opN.StageName != 'Closed Lost')
            {
                System.debug(opn.StageName);
                ltask1 = [select id,Status from task where whatid=:opN.id AND Status!='Completed'];
                System.debug(opn.Id);
                System.debug(ltask1);
                System.debug(ltask1.size());
                if(ltask1.size()>0)
                {
                    opn.addError('You cannot update status if there are task that is incomplete :(');                    
                }else{
                    flag=1;
                }
            }else{
                flag= 1;
            }
        }
    }
}