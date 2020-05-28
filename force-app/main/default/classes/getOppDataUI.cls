public class getOppDataUI {
    @AuraEnabled
    public static List<Opportunity> getOppList(Id acntId)
    {
        List<Opportunity> opList = [SELECT id, name, CloseDate FROM Opportunity WHERE AccountId = :acntId];
        System.debug(opList);
        return opList;
    }
}