@isTest
public class ASSI3_1_test 
{   
   /*public static testMethod void test_1()
    {
        Test.startTest();
        ASSI3_1.first();      
        Test.stopTest();
    }
	*/
    public static testMethod void test_2(){
		List<sObject> ls = Test.loadData(Account.sObjectType, 'AccountData');
        System.debug('liest '+ls);
        Test.startTest();
        ASSI3_1.second();
        Test.stopTest();
    }
    /*
    @isTest
    public static void test_3(){
        Test.startTest();
        ASSI3_1.third();
        Test.stopTest();
    }
    @isTest
    public static void test_4(){
        Test.startTest();
        ASSI3_1.fourth();
        Test.stopTest();
    }
    @isTest
    public static void test_5(){
        Test.startTest();
        ASSI3_1.fifth_A();
        ASSI3_1.fifth_B('Mahipal Jat');
        Test.stopTest();
    }
    @isTest
    public static void test_6(){
        Test.startTest();
        ASSI3_1.sixth();
        Test.stopTest();
    }
    @isTest
    public static void test_7(){
        Test.startTest();
        ASSI3_1.seventh();
        Test.stopTest();
    }
    @isTest
    public static void test_8(){
        Test.startTest();
        ASSI3_1.eighth();
        Test.stopTest();
    }
    @isTest
    public static void test_9(){
        Test.startTest();
		ASSI3_1.ninth('hey');
        Test.stopTest();
    } 
    @isTest
    public static void test_10(){
        Test.startTest();
        ASSI3_1.tenth();
        Test.stopTest();
    }
 */   
}