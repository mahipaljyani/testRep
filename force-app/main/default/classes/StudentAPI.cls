@RESTResource(urlMapping='/GetDetail/')
global class StudentAPI {
	@HTTPPost
    global static List<Sobject> creatingLead(){
		String ObjectName, ObjFieldName, fieldValue, fieldName;
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        String arr = req.requestBody.toString();
        JSONParser jp = JSON.createParser(arr);
        while(jp.nextToken() != null){
            if(jp.getCurrentToken() != JSONToken.END_OBJECT)
            {
                fieldName = jp.getCurrentName();
                fieldValue = jp.getText();
                if(fieldName == 'ObjectName')
                	ObjectName = fieldValue;
                else if (fieldName == 'ObjFieldName' )
                    ObjFieldName = fieldValue;
            }
        }
        String query = 'select Student_name__c, Student_email__c from '+ ObjectName + ' where '+ ' Student_name__c like \'%' + ObjFieldName + '%\'' ;  
        System.debug(query);
        list<Sobject> sObj = Database.query(query); 
        System.debug(sObj);
        return sObj;
    }
}