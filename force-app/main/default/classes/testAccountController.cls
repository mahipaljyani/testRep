public class testAccountController {
    @AuraEnabled
    public static list<Account> LoadAllAccountList()
    {
        list<Account> acc_list = [select id, Name, Phone,AnnualRevenue,Rating from Account];
        return acc_list;
    }    
}