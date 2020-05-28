public class q2CompController {
    @AuraEnabled
    public static void apexInsertRecord(Account acc, List<Contact> conList, List<Opportunity> opList)
    {
        insert acc;        
        for(Contact con : conList){
            con.AccountId = acc.Id;
        }
        for(Opportunity op :opList){
            op.AccountId = acc.id;
        }
        Database.insert(conList);
        Database.insert(opList);
    }    
}