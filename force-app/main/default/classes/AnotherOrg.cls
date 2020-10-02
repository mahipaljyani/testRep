public with sharing class AnotherOrg 
{
    // this is the main function which will call the another sfdx org for data sync
    @future (callout=true)
    public static void callApi(String cID)
    {
        Contact conFromSF = [select id,Email from contact where ID= :cID];
        
        // First Getting the Token value from settings
        mahijat__APIBuild__c TokenRes = getTokenFromSettings();
        String AuthorizationHeaderValue = 'Bearer '+TokenRes.get('mahijat__AccessTokenValue__c').toString();
        
        //Now Its Time for some Cool Work here we are calling an another org to get data
        HTTP h = new Http();
        HTTPRequest req = new HTTPRequest();
        String requestURL='https://ap16.salesforce.com/services/apexrest/ContactsAPI/'; 
        System.debug(requestURL);
        req.setEndpoint(requestURL);
        req.setMethod('GET');
        req.setHeader('Authorization', AuthorizationHeaderValue);
        req.setHeader('Content-Type','application/json');
        req.setHeader('Email',conFromSF.Email);
        HTTPResponse res = h.send(req);
        
        System.debug(res);
        System.debug(res.getBody());
        System.debug(res.getStatus());
        
        //Checking if Session is expired then do whatever we can :)  Status=Unauthorized, StatusCode=401
        if(res.getStatusCode() == 401 && res.getStatus() == 'Unauthorized' ){
            String Token = GenerateNewToken();
            
            AuthorizationHeaderValue = 'Bearer '+ Token;
            req.setHeader('Authorization', AuthorizationHeaderValue);
            res = h.send(req);                
            System.debug(res.getBody());
            
            //Updating new token in custom setting for further uses
            mahijat__APIBuild__c OldToken = [SELECT Id, mahijat__AccessTokenValue__c FROM mahijat__APIBuild__c];
            OldToken.mahijat__AccessTokenValue__c = Token;
            update OldToken;
            
        }
        Contact a = (Contact) JSON.deserialize(res.getBody(),Contact.class);
        System.debug(a);
        
        // Copying the contact data which we got from another org to our org contact object
        conFromSF = a;
        conFromSF.Id = cID;
        database.update(conFromSF);
    }
    
    // this function will generate a new access token for callout for the another org using the connected app creds
    public static String GenerateNewToken(){
        Http h1 = new Http();
        HttpRequest req1 = new HttpRequest();
        req1.setBody(
            'grant_type=password' + 
            '&client_id=3MVG9G9pzCUSkzZvpUhdKZ6BlpEVZyEFY3gmvR7NuiiaNdokfQzhvdTLrIqrFyxOEqF3nzquH8c6w4ip6xkXF' + 
            '&client_secret=F530FFDD54DBFF0B5DD5CB9A003E44F7B0D85D40C297FC11C4647D02BD5E7D1C' + 
            '&username=mahipal@unique.com' + 
            '&password=aspirine$9928d3XPUbCHtNCrfTnCqNm30xf0'
        );
        
        req1.setMethod('POST');
        req1.setEndpoint('https://login.salesforce.com/services/oauth2/token');
        HttpResponse res1 = h1.send(req1);
        Map<String,Object> tokenMap = (map<String,Object>)JSON.deserializeUntyped(res1.getBody());
        String Token = tokenMap.get('access_token').toString();
        return Token;
    }
    
    //Getting the Auth creds from custom setting
    public static mahijat__APIBuild__c getTokenFromSettings()
    {
        mahijat__APIBuild__c mp = [SELECT Id, mahijat__AccessTokenValue__c FROM mahijat__APIBuild__c];
        return mp;        
    }
    
    
}
