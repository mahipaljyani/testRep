public class Assignment4 {
	public static void r4(list<Integer> lst)
    {
        list<integer> final_lst = new list<integer>();
        final_lst.add(lst.get(lst.size()-1));
        integer lastMax = lst.get(lst.size()-1);
 		for(Integer i =lst.size()-2; i > 0;i--)
        {
        	if(lst.get(i) > lastMax)
            {
                final_lst.add(lst.get(i));
            	lastMax = lst.get(i);
            }
        }
        system.debug(final_lst);
    }
}