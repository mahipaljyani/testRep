public inherited sharing class LWCApexMethodDemoController { 
    @AuraEnabled(Cacheable = true) 
    public static List<Account> getAccounts()
    { 
        List<Account> ac_list = [SELECT Id, Name, Phone, AccountNumber, Industry, CreatedDate FROM Account ORDER BY createddate DESC Limit 10];
        System.debug('Account list : ' + ac_list);
        return ac_list; 
    }
}