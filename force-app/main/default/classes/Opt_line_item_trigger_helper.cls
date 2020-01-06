public class Opt_line_item_trigger_helper {
    public static void Q10(list<OpportunityLineItem> opt_line_itm)
    {
        //list<OpportunityLineItem> opt_line_itm = new list<OpportunityLineItem>();
        for(OpportunityLineItem opt : opt_line_itm )
        {
            if(opt.unitPrice <= 1000)
            {
                opt.addError('You cannot add product if the unit price is lower than 1000');
            }else{
                Product2 pd  = [SELECT Id, Description FROM Product2 where id = :opt.Product2Id];
                opt.Description = pd.Description;
            }
        }
    }
}