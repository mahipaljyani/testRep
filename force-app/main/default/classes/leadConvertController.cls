public class leadConvertController {
    @AuraEnabled
    public static Lead getLeadDetails(String leadId)
    {
		Lead leadRecord = [SELECT Id, IsDeleted, MasterRecordId, LastName, FirstName, Salutation, Name, Title, Company, Street, City, State, PostalCode, Country, Latitude, Longitude, GeocodeAccuracy, Address, Phone, MobilePhone, Fax, Email, Website, PhotoUrl, Description, LeadSource, Status, Industry, Rating, AnnualRevenue, NumberOfEmployees, OwnerId, IsConverted, ConvertedDate, ConvertedAccountId, ConvertedContactId, ConvertedOpportunityId, IsUnreadByOwner, CreatedDate, CreatedById, LastModifiedDate, LastModifiedById, SystemModstamp, LastActivityDate, LastViewedDate, LastReferencedDate, Jigsaw, JigsawContactId, CleanStatus, CompanyDunsNumber, DandbCompanyId, EmailBouncedReason, EmailBouncedDate, IndividualId, mahijat__SICCode__c, mahijat__ProductInterest__c, mahijat__Primary__c, mahijat__CurrentGenerators__c, mahijat__NumberofLocations__c FROM Lead Where Id = :leadId];
        System.debug('Lead is : ' + leadRecord);
        return leadRecord;
    }    
    
    @AuraEnabled
    public static Id apexLeadConvert(Account acc, Contact conList, Opportunity opList, Lead leadValue)
    {
        System.debug('Acc : ' + acc);
        System.debug('conList : ' + conList);
        System.debug('opList : ' + opList);
        System.debug('leadVal : ' + leadValue);
        Database.LeadConvert leadsToConvert = new Database.LeadConvert();
        LeadStatus convertStatus = [SELECT Id, MasterLabel FROM LeadStatus WHERE IsConverted=true LIMIT 1];
        leadsToConvert.setLeadId(leadValue.Id);
        leadsToConvert.setConvertedStatus(convertStatus.MasterLabel);
        
        Database.LeadConvertResult lc = Database.convertLead(leadsToConvert);
        system.debug(lc.getAccountId());
        system.debug(lc.getContactId());
        system.debug(lc.getOpportunityId());
        acc.Id = lc.getAccountId();
        conList.Id = lc.getContactId();
        opList.Id = lc.getOpportunityId();
        update acc;
        update conList;
        update opList;
        return acc.Id;
    	
    }    
}