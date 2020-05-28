public class multipleOppController {
	@AuraEnabled
    public static void apexInsertRecord(List<Opportunity> opList){
       System.debug(opList);
       Database.insert(opList,false);
    }
}