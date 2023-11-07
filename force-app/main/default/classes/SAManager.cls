public with sharing class SAManager {
  
        @AuraEnabled(cacheable=true scope='global')
        public static List<SA_Details__c> getAllSA(){
    
            return [SELECT Id, Name, Experience__c, Name__c, Customer_Handled__c, Date_of_Joining__c, Specilization__c, Location__Latitude__s, Location__Longitude__s FROM SA_Details__c ORDER BY Name__c LIMIT 20];
            
        }
        
    
        @AuraEnabled(cacheable=true scope='global')
        public static List<SA_Details__c> searchSas(String searchTerm) {
            
            searchTerm = searchTerm.trim();
            if (searchTerm == '') {
                return getAllSA();
            } //if nothing is typed into input, all the records will be available
            
            searchTerm = '%' + searchTerm + '%';  // wildcard
            
            //if you stype something into search input, records will be available based on the name filter
            return [
                SELECT
                    Id,
                    Name,
                    Experience__c,
                    Name__c,
                    Customer_Handled__c,
                    Date_of_Joining__c,
                    Location__Latitude__s,
                    Location__Longitude__s,
                    Specilization__c
                FROM SA_Details__c
                WHERE Name__c LIKE :searchTerm
                WITH SECURITY_ENFORCED
                ORDER BY Name__c
                LIMIT 20
            ];
        }
    }
