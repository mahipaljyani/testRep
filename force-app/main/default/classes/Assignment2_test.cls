@isTest
Global class Assignment2_test {
    @isTest
    static void all_test()
    {
        List<Integer> l1 = new List<Integer>{1,2,3,4,5,6,7,8};
        List<Integer> l2 = new List<Integer>{1,2,3,4,5,6,7,8};
		//Clockwise
        Assignment2_1.r2(l1,3);
        //Anti-Clockwise
        Assignment2_2.r2(l1,3);
    }
}