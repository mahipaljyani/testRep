global with sharing class ContactsSearchLWC {
    @AuraEnabled(cacheable=true)
    global static List<Sobject> getContactList(String ConName){
        List<Contact> conList = [SELECT id, Name, Email, Phone from Contact WHERE Name LIKE :ConName];
        return conList;
    }
    
    @AuraEnabled(cacheable=true)
	global static list<Contact> searchContact(String conName)
    {
        String query = 'select id, name, phone from contact where Name like \'%' + conName + '%\'';
        System.debug('query = ' + query);
        list<Contact> con_list = Database.query(query);
        System.debug('Contacy list from apex : '+con_list);
        return con_list;
    }
}