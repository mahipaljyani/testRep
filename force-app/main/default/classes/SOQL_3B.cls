public class SOQL_3B
{
	public static void r3()
    {
        List<Sobject> op = [select id, Account.name from Opportunity where Name Like '%B'];
        System.debug(op);
    }
}