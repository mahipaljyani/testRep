@RESTResource(urlMapping='/CreateLead/')
global class CreateLeadAPI {
	@HTTPPost
    global static string creatingLead(){
		String fName, lName, comp, fieldValue, fieldName;
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String arr = req.requestBody.toString();
        JSONParser jp = JSON.createParser(arr);
        while(jp.nextToken() != null){
            if(jp.getCurrentToken() != JSONToken.END_OBJECT)
            {
                fieldName = jp.getCurrentName();
                fieldValue = jp.getText();
                if(fieldName == 'FirstName')
                	fName = fieldValue;
                else if (fieldName == 'LastName' )
                    lName = fieldValue;
                else if (fieldName == 'Company')
                    comp = fieldValue;
            }
        }
        Lead l = new Lead(Firstname = fName, LastName = lName, Company = comp);
        insert l;
        System.debug(arr);
        return 'hello';        
    }
}