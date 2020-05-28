public class currencyAPI {
	public static Decimal main(Decimal usd)
    {
		HTTP h = new Http();
		HTTPRequest req = new HTTPRequest();
        req.setEndpoint('http://apilayer.net/api/live?access_key=837be579678e31fdda64f7b071f462c8&source=USD&currencies=INR&format=1');
        req.setMethod('GET');
        HTTPResponse res = h.send(req);
        Map<String,Object> jsonBody = (map<String,Object>)JSON.deserializeUntyped(res.getBody());
        Map<String,Object> map1 = (map<String,Object>)jsonBody.get('quotes');
        Decimal rate = (Decimal)map1.get('USDINR');
        //System.debug(rate);
        return (rate * usd);
    }
}