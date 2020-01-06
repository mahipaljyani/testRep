trigger OPT_LINE_ITEM_TRIGGER on OpportunityLineItem (before insert,after insert) {
    if(trigger.isBefore)
    {
        if(trigger.isInsert)
        {
            Opt_line_item_trigger_helper.Q10(trigger.new);
        }
    }
    if(trigger.isAfter)
    {
        
    }    
    
}