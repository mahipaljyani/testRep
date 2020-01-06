public class SOQL_3A
{
	public static void r3()
    {
        
        list<list<Sobject>> slst = [FIND 'test' IN ALL FIELDS Returning Faculity__c, Student__c];
        System.debug(slst);
        
        System.debug('===================================================');
        List<Account> op = [select id, (select id,phone from contacts),(select id from Opportunities),(select id,body from notes) from Account where Name Like 'B%'];
        Map<Id,list<Opportunity>> opMap = new Map<Id,list<Opportunity>>();
        Map<Id,list<contact>> conMap = new Map<Id,list<contact>>();
        Map<Id,list<note>> notesMap = new Map<Id,list<note>>();
        for(Account a : op)
        {
            opMap.put(a.Id,a.Opportunities);
            conMap.put(a.Id,a.Contacts);
            notesMap.put(a.Id,a.notes);            
        }
        
        
        
        // 3B
        //List<Sobject> op2 = [Select Id, Name, Account.Name From Contact Where AccountId In (Select AccountId From Opportunity Where Name Like '%A')];
		//List<Sobject> op2 = [Select Id, Name,(select name from Opportunities where name like '%A') OP From Account ];
		
       // List<Sobject> op2 = [select id, Name, Account.name, (select id,email from Account.contacts) from Opportunity where Name Like '%B'];
        //System.debug(op2);
    }
}