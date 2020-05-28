public class NewContactCompController {
    @AuraEnabled
    public static Contact getDataFromAnotherORG(String Email)
    {
        HTTP h = new Http();
        HTTPRequest req = new HTTPRequest();
        String requestURL='https://ap16.salesforce.com/services/apexrest/ContactsAPI/'; 
        System.debug(requestURL);
        req.setEndpoint(requestURL);
        req.setMethod('GET');
        
        mahijat__APIBuild__c TokenRes = AnotherOrg.getTokenFromSettings() ;
        String AuthorizationHeaderValue = 'Bearer '+TokenRes.get('mahijat__AccessTokenValue__c').toString();        

        req.setHeader('Authorization', AuthorizationHeaderValue);
        req.setHeader('Content-Type','application/json');
        req.setHeader('Email', Email);
        HTTPResponse res = h.send(req);
        System.debug(res.getBody());
        if(res.getStatusCode() == 401 && res.getStatus() == 'Unauthorized' ){
        	String Token = AnotherOrg.GenerateNewToken();
            
            AuthorizationHeaderValue = 'Bearer '+ Token;
            req.setHeader('Authorization', AuthorizationHeaderValue);
            res = h.send(req);                
            System.debug(res.getBody());
            
            mahijat__APIBuild__c OldToken = AnotherOrg.getTokenFromSettings();
            OldToken.mahijat__AccessTokenValue__c = Token;
            update OldToken;
        }
        
        Contact a = (Contact) JSON.deserialize(res.getBody(),Contact.class);
        Return a;
    }
}