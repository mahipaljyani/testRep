public class ASSI3_1 {
    public static void first()
    {
        // This will append TEST + i in student name where name starts with 'S' Character
        list<Student__c> std_list = [select id, Student_Name__c from Student__c where Student_Name__c like 'S%'];
        System.debug(std_list);
        
        for(Integer i =0; i < std_list.size(); i++){
            std_list[i].Student_Name__c += 'Test'+i;
        }
        update(std_list);
    }
    
    public static void second()
    {
        // this will add an oppertunity in account where opperunity is not available
        list<account> acnt_list = [select id, name, (select id,CloseDate,StageName from opportunities ) from account];        
        list<Opportunity> op_list = new list<Opportunity>();
        
        for(integer i =0; i < acnt_list.size(); i++)
        {
            if(acnt_list[i].opportunities.size() == 0)
            {
                Opportunity op = new Opportunity(AccountId=acnt_list[i].Id, Name= acnt_list[i].name+' First Oppertunity', StageName='Prospecting',CloseDate=Date.newInstance(2019,10,1));
                op_list.add(op);
            }   
        }
        insert(op_list);
    }
    
    public static void third()
    {
        // First insert account and contact related to it then delete it,then Undelete those records of Account object
        Account a = new Account(name='Mahi test1');
        insert a;
        Contact con = new Contact(AccountId	= a.ID, lastname='mahipal test1');
        insert con;
        delete a;
        undelete a;
    }    
    
    public static void fourth()
    {
    // update multiple fields in a single record without using UPDATE command. 
    // ANS : UPSERT :)
        Account a = [select name,Phone,ShippingAddress,Tradestyle from account where name= 'United Oil & Gas Corp.'];
        System.debug(a);
        a.Phone = '1234123412';
        a.Tradestyle = 'Test tradastyle';
        upsert(a);
    }
    
    public static void fifth_A()
    {
    // Delete those student records permanently from your salesforce org who have second letter ‘R’ in their names
        List<Student__c> st_list = [select id from Student__c where Student_name__c like '_S%'];
        list<ID> stid= new List<ID>{st_list[0].id};
        delete st_list;
        Database.emptyRecycleBin(stid);        
    }
    public static void fifth_B(String userName)
    {
    // Undelete the records of students who got deleted in between 1st May 18 and 30th May 18 by “Salesforce Demo’’ user.
        List<User> uName =  [select id from User where Name = :userName];
        Date StartDate = Date.newInstance(2019,12,1);
        Date EndDate = Date.newInstance(2019,12,31);
        ID userId= UName[0].Id;
        List<Student__c> st_list = [select id from Student__c WHERE isDeleted = true AND LastModifiedById = :userId AND (LastModifiedDate >= :StartDate AND LastModifiedDate <= :EndDate) ALL ROWS];
        System.debug(st_list);
        undelete(st_list);
    }
    
    public static void sixth() {
    // Create parent and child record in one insert call.
        Account parentAcnt = new Account(Name='TEST SINGLE yes',AcntExternalID__c='singleTEST2');
        Account Ref = new Account(AcntExternalID__c='singleTEST2');
        
        Opportunity op = new Opportunity(Name='single op',StageName='Prospecting',CloseDate=Date.newInstance(2020, 1,1));
        op.Account = Ref;
	
        Sobject[] sObj = new SObject[] { parentAcnt, op };
        Database.insert(sObj);
    }
    
    public static void seventh()
    {
        List<Account> ac_list = new List<Account>();
        for(Integer i=0 ;i <5; i++)
        {
            Account ac = new Account(Name= 'Hey Test '+i);
            ac_list.add(ac);
        }
        Database.SaveResult[] saveRst = Database.insert(ac_list);
        List<Id> SUCCESS_ac_list = new List<Id>();
        for(Database.SaveResult Sr : saveRst)
			if(Sr.isSuccess())
                    SUCCESS_ac_list.add(Sr.getId());

		list<Contact> conList = new List<Contact>();
        list<Opportunity> opList = new List<Opportunity>();
    	list<OpportunityLineItem> oplines = new list<OpportunityLineItem>();
        
        Integer i = 0;
    // Getting information about product and pricebooks
    	List<Product2> prods = [select id from product2];
        List<PriceBook2> pricebk = [select id from Pricebook2];
        List<PriceBookEntry> pbe = [select id from PricebookEntry];
        
        for( Id aId : SUCCESS_ac_list)
        {
            Contact con = new Contact(AccountId = aId, Lastname = i+' test');

            Opportunity op = new Opportunity(AccountId=aId, OptExternalID__c = i+'op_REF', Name= i+' test',StageName='Prospecting',CloseDate=Date.newInstance(2020, 1,1));
            Opportunity op_ref = new Opportunity(OptExternalID__c = i+'op_REF');
          
            OpportunityLineItem op_line_item=new OpportunityLineItem(PriceBookEntryId = pbe[0].Id, Quantity=1,Unitprice=1);
			op_line_item.Opportunity = op_ref;
            
            conList.add(con);
            opList.add(op);
            oplines.add(op_line_item);
            i++;
        }
        Database.insert(conList);
        Database.insert(opList);
        Database.insert(oplines);
    }    
    public static void eighth()
    {
        //Delete those Accounts who have more than 2 opportunities.
        list<Account> ac_list = [select id, (select id,StageName from opportunities) from account];
        list<Account> new_ac_list = new List<Account>();
        list<Opportunity> op_list = new list<Opportunity>();

        for(account a : ac_list)
        {
            if(a.opportunities.size() > 2)
            {
            	new_ac_list.add(a);
	            for(Opportunity op : a.opportunities)
   	         	{
    	            //if(op.StageName=='Closed Won')
        	    	op_list.add(op);
            	}
            }
        }
        Database.delete(op_list,false);
        Database.delete(new_ac_list,false);
    }
    
    public static void ninth(String s)
    {        
        String QueryString = 'SELECT count() FROM Account'; 
        Integer i = Database.countQuery(QueryString);
        System.debug(i);
    }
    
    public static void tenth()
    {
        List<Account> std_list = new List<Account>();
        for(integer i =0; i<3; i++){
            Account a = new Account(name= 'tenth'+i);
            std_list.add(a);
        }
        Account ac = new Account(AnnualRevenue= 10000);	// Account with error
        std_list.add(ac);
        Account ac1 = new Account(AnnualRevenue= 100001); // Account with error
        std_list.add(ac1);
                
        SavePoint s1 = Database.setSavepoint();
        Database.SaveResult[] saverst = Database.insert(std_list, false);
        Integer succesedCnt = 0;
        for(Database.SaveResult sr : saveRst)
            if(sr.isSuccess())
                succesedCnt++;
        if(succesedCnt<=3)
            Database.rollback(s1);
        //System.debug(succesedCnt);
    }
}