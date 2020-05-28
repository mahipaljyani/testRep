@isTest
public class TestSetupClass {
    @testSetup 
    static void setup() {
        List<Account> testAccts = new List<Account>();
        for(Integer i=0;i<2;i++) {
            testAccts.add(new Account(Name = 'TestAcct'+i));
        }
        insert testAccts;        
    }
     
    public static testmethod void testLoadData() {
        List<sObject> ls = Test.loadData(Account.sObjectType, 'AccountData');        
        // Get first test account
        System.debug('All data');
        Account a1 = (Account)ls[0];
        String acctName = a1.Name;
        System.debug(acctName);
        
        // Perform some testing using the test records
    }
    
    //    List<sObject> ls = Test.loadData(Account.sObjectType, 'myResource');
}