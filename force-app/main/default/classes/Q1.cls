public class Q1 {
    public static void r1()
    {
        list<contact> arr_rst = [select ID,name from contact order by name DESC ];     
        map<String,Id> act_set = new map<String,Id>();        
        for(contact ac : arr_rst)
        {
			if(act_set.containsKey(ac.name))
				delete ac;
            else
                act_set.put(ac.Name,ac.Id);
        }
    }
}