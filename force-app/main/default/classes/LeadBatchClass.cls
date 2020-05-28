global class LeadBatchClass implements Database.Batchable<sObject> 
{
    public static List<Opportunity> opp_list;
    public LeadBatchClass(List<Sobject> Opper_list)
    {
        opp_list = Opper_list;
    }
    global List<Opportunity> start(Database.BatchableContext BC){
       //String query = 'select id, name from account';
       return opp_list;
   }

   global void execute(Database.BatchableContext BC, List<Opportunity> opp_list){
       System.debug('Before llist: '+opp_list);
       for(Opportunity a : opp_list){
           a.name += 'batch';
       }
       System.debug('After List'+opp_list);
       Database.update(opp_list);
   }

   global void finish(Database.BatchableContext BC){
   }
}