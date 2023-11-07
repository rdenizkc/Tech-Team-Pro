@isTest
public class ContactTriggerHandlerClass1Test {

    @isTest
    static void testActiveContacts() {
        // Create test data - accounts and contacts
        Account acc = new Account(Name='Test Account');
        insert acc;

        List<Contact> conList = new List<Contact>();
        for (Integer i = 0; i < 3; i++) {
            conList.add(new Contact(FirstName='Test', LastName='Contact ' + i, AccountId=acc.Id, ActiveLions__c = true));
        }
        insert conList;
        
        

        // Call the trigger handler method
        ContactTriggerHandlerClass1.activeContacts(conList);

        // Verify that the Active_ContactsLion__c field is updated on the account
        acc = [SELECT Id, Active_ContactsLion__c FROM Account WHERE Id = :acc.Id LIMIT 1];
    
    System.assertEquals(conList.size(), acc.Active_ContactsLion__c, 'Active_ContactsLion__c should be equal to the number of contacts'); 
        
 
       

       
            }

    @isTest
    static void testDeleteContacts() {
        // Create test data - account and contacts
        Account acc = new Account(Name='Test Account');
        insert acc;

        List<Contact> conList = new List<Contact>();
        for (Integer i = 0; i < 3; i++) {
            conList.add(new Contact(FirstName='Test', LastName='Contact ' + i, AccountId=acc.Id,ActiveLions__c = true));
        }
        insert conList;
       
        delete conList[0];

        // Call the trigger handler method
        ContactTriggerHandlerClass1.deleteContacts(conList);

        // Verify that the Active_ContactsLion__c field is updated on the account
        acc = [SELECT Id, Active_ContactsLion__c FROM Account WHERE Id = :acc.Id LIMIT 1];
      
        
        
      System.assertEquals((conList.size()-1), acc.Active_ContactsLion__c, 'Active_ContactsLion__c should be equal to the number of contacts');

    }      
    @isTest
    static void testUpdateContacts() {
        // Create test data - account and contacts
        Account acc = new Account(Name='Test Account');
        insert acc;

        List<Contact> conList = new List<Contact>();
        for (Integer i = 0; i < 3; i++) {
            conList.add(new Contact(FirstName='Test', LastName='Contact ' + i, AccountId=acc.Id,ActiveLions__c = true));
        }
        insert conList;

        // Call the trigger handler method
        conList[0].ActiveLions__c = false;
        
        update conList;

        // Verify that the Active_ContactsLion__c field is updated on the account
       acc = [SELECT Id, Active_ContactsLion__c FROM Account WHERE Id = :acc.Id LIMIT 1];
       
        System.assertEquals(2, acc.Active_ContactsLion__c);
        
        System.assertEquals((conList.size()-1), acc.Active_ContactsLion__c, 'Active_ContactsLion__c should be equal to the number of contacts');

       
            
    }    
    
}