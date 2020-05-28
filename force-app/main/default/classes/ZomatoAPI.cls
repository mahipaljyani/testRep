public class ZomatoAPI {
    @AuraEnabled
    public static Map<String,Object> getData(String RestId)
    {
        System.debug('Entered'+RestId);
        HTTP h = new Http();
        HTTPRequest req = new HTTPRequest();
        String requestURL='';
        if(RestId == null){
        	requestURL = 'https://developers.zomato.com/api/v2.1/restaurant?res_id=101837'; 
        }else{
            requestURL = 'https://developers.zomato.com/api/v2.1/restaurant?res_id='+RestId;
        }
        
        System.debug(requestURL);
        req.setEndpoint(requestURL);
        req.setMethod('GET');
        req.setHeader('user-key', '388535f7ae2f5eb127a69c16bbba9db0');
        req.setHeader('Content-Type','application/json');
        HTTPResponse res = h.send(req);
        Map<String,Object> jsonBody = (map<String,Object>)JSON.deserializeUntyped(res.getBody());
        System.debug(res);
        return jsonBody;
    }
    @AuraEnabled
    public static Map<String,Object> getRestlist(String RestKeyword)
    {
        HTTP h = new Http();
        HTTPRequest req = new HTTPRequest();
        String requestURL='';
        if(RestKeyword == null){
        	requestURL = 'https://developers.zomato.com/api/v2.1/search?entity_type=city&q='; 
        }else{
            requestURL = 'https://developers.zomato.com/api/v2.1/search?entity_type=city&q='+RestKeyword;
        }        
        System.debug(requestURL);
        req.setEndpoint(requestURL);
        req.setMethod('GET');
        req.setHeader('user-key', '388535f7ae2f5eb127a69c16bbba9db0');
        req.setHeader('Content-Type','application/json');
        HTTPResponse res = h.send(req);
        Map<String,Object> jsonBody = (map<String,Object>)JSON.deserializeUntyped(res.getBody());
        System.debug(jsonBody);
        return jsonBody;
    }
}