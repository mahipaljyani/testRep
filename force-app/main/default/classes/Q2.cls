public class Q2 {
	public static void r2(id a, id b)
    {
        list<account> scnd_lst  = [select id, name , (select ID, AccountId from contacts) from account where id= :b];
        list<contact> c_lst = scnd_lst[0].contacts;
        
        for(integer i = 0;i< c_lst.size(); i++)
            c_lst[i].AccountId = a;
        
        update c_lst;
        delete scnd_lst;        
    }
}