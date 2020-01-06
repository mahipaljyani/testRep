public class Practice {
    public static void R1()
    {
        Map<Integer,List<String>> Cars = new Map<Integer,List<String>>();
        Id Owner = '0052w000000s15eAAA';
        list<Sobject> lst = [select Name,CALENDAR_YEAR(SLAExpirationDate__c) Year from account where OwnerId= :Owner Group by Name, CALENDAR_YEAR(SLAExpirationDate__c)];
        System.debug(lst);
        For(Sobject a : lst)
        {
            Integer year = (Integer)a.get('Year');
            //List<String> c = new List<String>{a.get('Name').toString()};
            List<String> c = new List<String>();
            if(Cars.ContainsKey(Year))
            {
                c.addAll(Cars.get(Year));
                c.add(a.get('Name').toString());
            }else{
              	c.add(a.get('Name').toString());
            }
            Cars.put(year,c);
        }
        System.debug(Cars);
    }
}