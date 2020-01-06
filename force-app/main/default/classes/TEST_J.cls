public class TEST_J {
	public static void test(String Course, Integer start_fee, Integer last_fee)
    {
    	list<Student_in_batch__c> lst = [select id,Student__r.Student_Name__c from Student_in_batch__c where Batch__r.Course__r.Name = :Course AND Student__r.Course_Fee__c >= :start_fee AND Student__r.Course_Fee__c <= :last_fee ];
        System.debug(lst);
    }
    public static void MergeTest()
    {
        list<Account> acnt_lis = [select id from account limit 2];
        //System.debug(acnt_lis);
        Savepoint sp1 = Database.setSavepoint();
        merge acnt_lis[1] acnt_lis[0];
        Database.rollback(sp1);
    }
}