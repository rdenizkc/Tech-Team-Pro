public with sharing class saDetailsController {
    @AuraEnabled(cacheable=true)
    public static List<SA_Details__c> getSalesAssociateDetails() {
        // Query the SA Details records from Salesforce
        List<SA_Details__c> saDetails = [SELECT Name, Customer_Handled__c, Date_of_Joining__c, Experience__c 
                                          FROM SA_Details__c ];
        return saDetails;
    }

    @AuraEnabled(cacheable=true)
    public static List<SA_Details__c> searchSA(String searchKey) {

        searchKey = '%'+searchKey + '%';


        return [SELECT Id, Name,  Name__c, Customer_Handled__c, Date_of_Joining__c, Experience__c
        FROM SA_Details__c
        WHERE Name__c LIKE : searchKey
        WITH SECURITY_ENFORCED
        ORDER BY Name__c ASC ]; 
}
}
