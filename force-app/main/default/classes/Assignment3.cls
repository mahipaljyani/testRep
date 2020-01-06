public class Assignment3 {
	public static void r3(list<Integer> l1,list<Integer> l2, list<Integer> l3)
    {
        set<integer> final_set = new set<integer>();
        for(integer i=0; i < l1.size(); i++)
        {
            integer value = l1.get(i);
            if( (l2.contains(value)) && (l3.contains(value)) )
                final_set.add(value);
        }
        System.debug(final_set);
        
    }
}