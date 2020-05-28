@isTest
global class Assignment3_test {
	@isTest
    public static void all_test()
    {
        List<Integer> l1 = new List<Integer>{1,4,6};
        List<Integer> l2 = new List<Integer>{1,4,3};
		List<Integer> l3 = new List<Integer>{2,2,1};
        Assignment3.r3(l1, l2, l3);
    }
}