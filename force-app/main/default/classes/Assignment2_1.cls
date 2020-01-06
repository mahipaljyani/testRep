public class Assignment2_1{
    // Clockwise 
	public static void r2(list<Integer> lst, Integer steps)
    {
        for(Integer i = 0; i < steps; i++)
        {
            lst.add(lst.get(0));
            lst.remove(0);
        }
        System.debug(lst);
    }
}