public class ContactTriggerHandlerClass1 {
    
    public static void activeContacts(List<Contact> conList) {
        Set<Id> accIdSet = new Set<Id>();
        
        for (Contact cons : conList) {
            accIdSet.add(cons.AccountId);
        }
        
        List<Account> accList = [
            SELECT Id, Active_ContactsLion__c, 
            (SELECT Id, ActiveLions__c FROM Contacts WHERE ActiveLions__c = true) 
            FROM Account 
            WHERE Id IN :accIdSet
        ];
        
        for (Account acc : accList) {
            if(!acc.Contacts.isEmpty()){
                acc.Active_ContactsLion__c = acc.Contacts.size();}
            else{
                acc.Active_ContactsLion__c =0;  
            }
        }
        
        update accList;
    }
     public static void deleteContacts(List<Contact> conList) {
        Set<Id> accIdSet = new Set<Id>();
        
        for (Contact cons : conList) {
            
            accIdSet.add(cons.AccountId);
        }
        
        List<Account> accList = [
            SELECT Id, Active_ContactsLion__c, 
            (SELECT Id, ActiveLions__c FROM Contacts WHERE ActiveLions__c = true) 
            FROM Account 
            WHERE Id IN :accIdSet
        ];
        
        for (Account acc : accList) {
            if(!acc.Contacts.isEmpty()){
                acc.Active_ContactsLion__c = acc.Contacts.size();}
            else{
                acc.Active_ContactsLion__c =0;  
            }
        }
        
        update accList;
    }
    
    public static void updateContacts(List<Contact> conList, map<Id,Contact> oldMap){
        Set<Id> accIdSet = new Set<Id>();
        
        for (Contact cons : conList) {
          if((cons.ActiveLions__c!=oldMap.get(cons.Id).ActiveLions__c ) ||(cons.AccountId!=oldMap.get(cons.Id).AccountId))
            accIdSet.add(cons.AccountId);
            accIdSet.add(oldMap.get(cons.Id).AccountId);
        }
        
        List<Account> accList = [
            SELECT Id, Active_ContactsLion__c, 
            (SELECT Id, ActiveLions__c FROM Contacts WHERE ActiveLions__c = true) 
            FROM Account 
            WHERE Id IN :accIdSet
        ];
        
        for (Account acc : accList) {
            if(!acc.Contacts.isEmpty()){
                acc.Active_ContactsLion__c = acc.Contacts.size();}
            else{
                acc.Active_ContactsLion__c =0;  
            }
        }
        
        update accList;
    }
   }