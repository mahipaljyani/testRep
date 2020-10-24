gl1obal class Assignment1 implements Schedulable{
	//this is a example of schedule class in salesforce
    global static void execute(SchedulableContext sc)
    {
        list<list<String>> l1 = new list<list<String>>{};
        Assignment1.r1(l1);
    }
	public static void r1(list<list<String>> final_lst)
    {
        list<list<String>> result_lst = new list<list<String>>();
        set<String> str_set = new set<String>();
        for(integer i=0; i<final_lst.size(); i++)
        {
            list<String> temp_list = new list<String>();
		
            for(integer j=0; j< final_lst[i].size();j++)
            {
             // This block will split the string using ; in string[] then will sort and store them in set for uniqueness
                string[] str = final_lst[i].get(j).split(';');
                str.sort();
                str_set.addAll(str);
                
             // This block will convert SET back to LIST and add ; back in string set
                list<String> temp_list2 = new List<String>();
                temp_list2.addAll(str_set);
                String str_to_add = '';
                for(integer k = 0; k < temp_list2.size()-1; k++)
                    str_to_add += temp_list2.get(k) + ';';

                str_to_add+= temp_list2.get(temp_list2.size()-1);
                
                temp_list.add(str_to_add);
             // Cleaning    
                temp_list2.clear();
                str_set.clear();
            }
            result_lst.add(temp_list);
		}
        System.debug(result_lst);
    }
}
