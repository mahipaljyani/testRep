public class ContactSearchController {
    @AuraEnabled
	public static list<Contact> getContactList()
    {
        list<Contact> con_list = [select id, name, phone from contact];
        System.debug(con_list);
        return con_list;
    }
    
    @AuraEnabled
	public static list<Contact> SearchContact(String conName)
    {
        String query = 'select id, name, phone from contact where Name like \'%' + conName + '%\'';
        System.debug('query = ' + query);
        list<Contact> con_list = Database.query(query);
        System.debug('Contacy list from apex : '+con_list);
        return con_list;
    }

    @AuraEnabled
	public static Contact ContactInfo(String id)
    {
        String query = 'select id, name, phone from contact where id = \''+ id + '\'';
        System.debug('query is : '+query);
        Contact con_list = Database.query(query);
        System.debug('Contact ifno from apex : '+con_list);
        return con_list;
    }
}