public class SOQL_2 {
	public static void r2(String AName, Date StartingDate, Date EndingDate)
    {
        List<Sobject> op = [select ID,CloseDate from Opportunity where CloseDate>= :StartingDate AND CloseDate <= :EndingDate AND Owner.name = :Aname];
        System.debug(op);
    }
}