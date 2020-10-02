@RESTResource(urlMapping='/AccountManagement/')
global class AccountManagemntAPI {
    //To get the account information
    @HTTPGet
    global static String getInfoByID(){
        String ObjectName, IDValue, fieldValue, fieldName;
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        IDValue = req.headers.get('ID');
        ObjectName = req.headers.get('ObjectName');
        
        String query = 'select name, AnnualRevenue from '+ ObjectName + ' where '+ ' id = :IDValue';
        Account sObj = Database.query(query); 
        String strResponse = '{ "Name": "' + sObj.get('name') +'", "AnnualRevenue": "' + sObj.get('AnnualRevenue')+ '" }';
        System.debug(strResponse);
        return strResponse;
    }
    
    // For creating a new account object record in sf
    @HTTPPost
    global static String createAccount(){
       // String fieldValue, fieldName;
        RestRequest req = RestContext.request;
        String jsonText = req.requestBody.toString();
        Account a = (Account) JSON.deserialize(jsonText,Account.class);
        insert a;
        System.debug(a);
        return a.id + 'Account id';
    }
    
    /*global static String createAccount(){
        String fieldValue, fieldName;
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String arr = req.requestBody.toString();
        JSONParser jp = JSON.createParser(arr);
        //list<Account> acc_list = new list<Account>();
        Account a = new Account();
        while(jp.nextToken() != null){
            
            if(jp.getCurrentToken() != JSONToken.END_OBJECT)
            {
                fieldName = jp.getCurrentName();
                fieldValue = jp.getText();
                if(fieldName == 'name')
                    a.name = fieldValue;
                else if (fieldName == 'Site' )
                    a.Site = fieldValue;
            }
        }
        insert a;
        //acc_list.add(a);
        return ''+a.id;
    }*/
    
    // Updating the account object record
    @HTTPPatch
    global static String updateAccount(){
        String fieldValue, fieldName;
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String arr = req.requestBody.toString();
        JSONParser jp = JSON.createParser(arr);
        //list<Account> acc_list = new list<Account>();
        Account a = new Account();
        Map<String,String> accMap = new Map<String,String>();
        while(jp.nextToken() != null){
            if(jp.getCurrentToken() != JSONToken.END_OBJECT)
            {
                fieldName = jp.getCurrentName();
                fieldValue = jp.getText();
                if(fieldName != null && fieldValue != null)
                {
                    accMap.put(fieldName,fieldValue);
                }
            }
        }
        for(String fieldNameMap : accMap.keySet())
        {
            a.put(fieldNameMap,accMap.get(fieldNameMap));
            System.debug('field name is ' + fieldNameMap + 'value is : ' + accMap.get(fieldNameMap));
        }
        //System.debug(a);
        update a;
        //acc_list.add(a);
        //return ''+a.id;
        return (a.Id+'');
    }
    
    //inserting multiple account records at once
    @HTTPPut
    global static String insertMultiple(){
        RestRequest req = RestContext.request;
        List<account> accList = (List<Account>) JSON.deserialize(req.requestBody.toString(), List<Account>.class);
        System.debug(acclist);
       // Database.insert(accList);
        return '';
    }
}
