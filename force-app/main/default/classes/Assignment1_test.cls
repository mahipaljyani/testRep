@isTest
global class Assignment1_test {
	@isTest
    global static void test_all(){
       List<List<String>> ll = new List<List<String>>();
        String a1 = 'a;b;a;v;c';
        String a2 = 'x;x;y;c;q';
        String a3 = 'm;b;h;j;m';
        String a4 = 'u;k;j;u';
        List<List<String>> pass = new List<List<String>>();
        List<String> ls1 = new List<String>{a1,a2};
        List<String> ls2 = new List<String>{a3,a4};
        pass.add(ls1);
        pass.add(ls2);
        Assignment1.r1(pass);
    }
}