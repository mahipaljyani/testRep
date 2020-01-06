public class classTest {
	public static void r1()
    {
        list<Sobject> op2 = [SELECT Id, OpportunityId, ContactId, Opportunity.Account.Name FROM OpportunityContactRole Where Opportunity.name like '%a'];
        system.debug(op2);
        system.debug('-=-=-=-=-===-=-=-=-=-=');
        //SELECT Id, OpportunityId, ContactId FROM OpportunityContactRole
        
        //Id owner = UserInfo.getUserId();
        //list<list<Sobject>> lst = [Find 'Test' IN ALL FIELDS RETURNING Account(id where OwnerID = :UserInfo.getUserId()), Contact, Opportunity(id where CloseDate = THIS_FISCAL_YEAR)];
        //System.debug(lst);
          
        
        //list<String> std = new List<String>{'Mahipal','Harsh','Prem'};
     	//list<Student__c> lst = [select id, Student_Name__c from Student__c where Student_Name__c IN :std AND Registration_Date__c = THIS_FISCAL_QUARTER];
        //System.debug(lst);
        //WHERE Batch__r.Course__r.Name != 'Php'
        
        
//        list<Student_in_batch__c> lstTest = [select Id,Student__r.Name, Batch__r.Course__r.Name , Batch__r.Course__r.Faculity__r.Name from Student_in_batch__c WHERE Student__r.Name LIKE 'Kri%' AND Batch__r.Course__r.Faculity__r.Name LIKE 'Kri%' AND Batch__r.Course__r.Name != 'Php'];
//        list<Student_in_batch__c> lstTest = [select Id,Student__r.Name, Batch__r.Course__r.Name , Batch__r.Course__r.Faculity__r.Name from Student_in_batch__c WHERE Student__r.Name LIKE 'Kri%' AND Batch__r.Course__r.Faculity__r.Name LIKE 'Kri%' AND Batch__r.Course__r.Name != 'Php'];
  //      System.debug(lstTest);
        
        //list<Sobject> lst1 = [select Id,Student__r.Name, Batch__r.Course__r.Name , Batch__r.Course__r.Faculity__r.Name from Student_in_batch__c ];
        //System.debug(lst1);
        
        
        //list<batch__c> lst2 = [select Id,Name, Course__r.Name, Course__r.Faculity__r.Name from Batch__c];
        //System.debug(lst2[0].Course__r.Faculity__r.Name);
        
        System.debug('================================3A==================================');
        List<Account> op = [select id, 
                            (select id from contacts), 
                            (select id from Opportunities where name like '%A') 
                            from Account];		
		for(Account a : op)
        {
            System.debug(a.contacts);
        }
        //System.debug(op);
    }
}