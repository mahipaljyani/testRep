public inherited sharing class LWCStudentsDetails { 
    @AuraEnabled(Cacheable = true) 
    public static List<mahijat__Class_Student__c> getStudents()
    { 
        List<mahijat__Class_Student__c> st_list = [SELECT Id, Name, mahijat__Class_Name__c, mahijat__SittingPosition__c, mahijat__Student_Name__c, mahijat__Percentage__c, mahijat__Seat_Assigned__c FROM mahijat__Class_Student__c ORDER BY mahijat__SittingPosition__c ASC];
        System.debug('Student list : ' + st_list);
        return st_list; 
    }

    @AuraEnabled(Cacheable = true) 
    public static List<mahijat__class__c> getClasses()
    { 
        List<mahijat__class__c> cls_list = [SELECT Id, Name, mahijat__Class_Name__c,  mahijat__ColumnCount__c FROM mahijat__class__c];
        System.debug('Class list : ' + cls_list);
        return cls_list; 
    }
}