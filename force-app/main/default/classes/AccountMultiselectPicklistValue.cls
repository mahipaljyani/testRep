public class AccountMultiselectPicklistValue {
    @AuraEnabled
    public static Map<String,String> getPicksVal()
    {   
        String objectName = 'Account';
        String fieldName ='mahijat__MultiPicklist__c';
        Map<String,String> picklistValues = new Map<String,String>();
        
        Schema.SObjectType s = Schema.getGlobalDescribe().get(objectName) ;
        Schema.DescribeSObjectResult r = s.getDescribe() ;
        Map<String,Schema.SObjectField> fields = r.fields.getMap() ;
        Schema.DescribeFieldResult fieldResult = fields.get(fieldName).getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for( Schema.PicklistEntry pickListVal : ple){
            picklistValues.put(pickListVal.getLabel(), pickListVal.getValue());
            System.debug(pickListVal.getLabel() +' '+pickListVal.getValue());
        }
        return picklistValues;
    } 
    
}