public class ApexTest {
    
    //String test ='This this is is done by Code code';
    //ApexTest1.main(test);
    public static void Q1(String testData){
        Map<String,Integer> sMap = new Map<String,Integer>();
        String[] vals = testData.split(' ');
        System.debug(vals);
        for(String value : vals){
            if(sMap.containsKey(value)){
                sMap.put(value, sMap.get(value)+1);
            }else{
                sMap.put(value,1);
            }
        }
        System.debug(sMap);
    }
    public static void Q2(){
        Account acnt  = new Account(Name='Hey Test 06', mahijat__AcntExternalID__c = 'randomIdddd');
        Account acRef = new Account(mahijat__AcntExternalID__c = 'randomIdddd');
        Contact con = new Contact(LastName = 'Con Last Name');
        con.Account = acRef;
        Database.insert(new SObject[] { acnt, con});
    }
    
    public static void Q3(){
        List<Contact> con_list = [SELECT name FROM contact WHERE mahijat__Weigth__c > 100 AND phone !=null AND email != null AND Birthdate = TODAY Order By Name Desc LIMIT 5];
        System.debug(con_list);
    }
    
    public static void Q4(){
        System.debug('Types of Collections Supported in Apex');
        System.debug('Set, Map, List');
    }
    
    public static void Q5()
    {
        // continent => country => state => city
        Map<String,Map<String,Map<String,list<String>>>> cdMap = new Map<String,Map<String,Map<String,list<String>>>>(); 
        List<mahijat__CityData__c> main_map = [SELECT Id, Name, mahijat__state__c, mahijat__country__c, mahijat__continent__c FROM mahijat__CityData__c];
        System.debug(main_map);
        for(mahijat__CityData__c cData : main_map){
            if(cdMap.containsKey(cData.mahijat__continent__c))
            {
                Map<String,Map<String,list<String>>> CountryList = cdMap.get(cData.mahijat__continent__c);
                if(CountryList.containsKey(cData.mahijat__country__c)){
                    Map<String,list<String>> state_list = CountryList.get(cData.mahijat__country__c);
                    if(state_list.containsKey(cData.mahijat__state__c))
                    {
                        list<String> city_list = state_list.get(cData.mahijat__state__c);
                        city_list.add(cData.Name);
                        state_list.put(cData.mahijat__state__c,city_list);
                    }else{
                     	list<String> city_list = new List<String>();
                        city_list.add(cData.Name);
                        state_list.put(cData.mahijat__state__c,city_list);   
                    }
                }else{
                    Map<String,list<String>> state_list = new Map<String,list<String>>();
                    
                    list<String> city_list = new list<String>();
                    city_list.add(cData.Name);
                    
                    state_list.put(cData.mahijat__state__c,city_list);
                    CountryList.put(cData.mahijat__country__c,state_list);
                    cdMap.put(cData.mahijat__continent__c,CountryList);
                    
                }
            }else{
                Map<String,Map<String,list<String>>> CountryList = new Map<String,Map<String,list<String>>>();
                
                Map<String,list<String>> state_list = new Map<String,list<String>>();
                
                list<String> city_list = new list<String>();
                city_list.add(cData.Name);
                
                state_list.put(cData.mahijat__state__c,city_list);
                CountryList.put(cData.mahijat__country__c,state_list);
                cdMap.put(cData.mahijat__continent__c,CountryList);
            }
        }
        System.debug(cdMap);
    }
    
    
    public static List<List<sObject>> Q6(String SearchValue)
    {
        String searchQuery = 'FIND \'%' + SearchValue + '%\' IN NAME FIELDS RETURNING Lead(Name,FirstName,LastName ), Contact(FirstName,LastName )';
        List<List<sObject>> searchRes = search.query(searchQuery);
        System.debug(searchRes);
        return searchRes;
    }
    
}