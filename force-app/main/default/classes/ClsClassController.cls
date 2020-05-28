public class ClsClassController {
    
    @AuraEnabled
    public static list<mahijat__class__c> LoadAllClassList()
    {
        list<mahijat__class__c> con_list = [select id, mahijat__Class_Name__c,  mahijat__ColumnCount__c, (select id, name, mahijat__Class_Name__c,mahijat__SittingPosition__c, mahijat__Student_Name__c from mahijat__Class_Students__r) from mahijat__class__c];
        System.debug(con_list);
        return con_list;
    }
}