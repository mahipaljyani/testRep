public with sharing class ExternalClass {
    @future (callout=true)
    public static void callApi(String cID){
		Contact conFromSF = [select id,Email from contact where ID= :cID];
        System.debug(conFromSF);
        
        HTTP h = new Http();
        HTTPRequest req = new HTTPRequest();
        String requestURL = 'http://5e2bec444fdc030014e21258.mockapi.io/Contact'; 
        req.setEndpoint(requestURL);
        req.setMethod('GET');
        //req.setHeader('Content-Type','application/json');
        HTTPResponse res = h.send(req);                   
        System.debug(res.getBody());
        List<Contact> conList = (List<Contact>) JSON.deserialize(res.getBody(), List<Contact>.class);
        for(Contact c : conList)
        {
            if(conFromSF.Email == c.Email){
                conFromSF = c;
            }
        }
        conFromSF.Id = cID;
        database.update(conFromSF);
    }
}