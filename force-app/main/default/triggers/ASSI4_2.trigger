trigger ASSI4_2 on Opportunity (before insert) {
    List<Opportunity> op = trigger.new;
    for(integer i = 0; i< op.size(); i++)
    {
        list<Opportunity> opls = [select id from Opportunity where name= :op[i].name AND accountid = :op[i].accountid];
        if(opls.size() > 0)
        {
            op[i].name += ' Duplicate Opt';
        }
    }
}