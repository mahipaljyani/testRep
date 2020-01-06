public class SOQL_1 {
	public static void r1()
    {
        ID userId= UserInfo.getUserId();
        List<Sobject> op = [select SUM(amount),FISCAL_YEAR(CloseDate) from Opportunity where OwnerID = :userId AND (StageName = 'Closed Won' OR StageName = 'Closed Lost') Group by FISCAL_YEAR(CloseDate)];
        System.debug(op);
    }
}