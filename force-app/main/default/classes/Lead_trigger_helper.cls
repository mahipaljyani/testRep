public class Lead_trigger_helper {
    public static void Q6(List<lead> myLead)
    {
        //List<Lead> myLead = trigger.new;
        List<Database.LeadConvert> cnLeads = new List<Database.LeadConvert>();
        for(integer i=0; i<mylead.size(); i++)
        {
            if(mylead[i].LeadSource=='Phone Inquiry')
            {
                Database.LeadConvert lc = new Database.LeadConvert();
                lc.setLeadId(myLead[0].id);
                lc.ConvertedStatus = 'Closed - Converted';
                lc.ownerId = '0052w0000011KieAAE';
                cnLeads.add(lc);
            }
        }	
        System.debug(cnLeads);
        Database.convertLead(cnLeads);
        
    }
}