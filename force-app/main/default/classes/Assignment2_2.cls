public class Assignment2_2 {
    // Anti-Clockwise 
	public static void r2(list<Integer> lst, Integer steps)
    {
        for(Integer i = 0; i < steps; i++)
        {
            lst.add(0,lst.get(lst.size()-1));
            lst.remove(lst.size()-1);
        }
        System.debug(lst);
    }
}