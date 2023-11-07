public class UpdateLeadSourceBatchL implements Database.Batchable<sObject> ,Database.Stateful {
 
    public integer count=0;
    
    public Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator([SELECT Id, LeadSource FROM Lead WHERE LeadSource = NULL]);
    }

    public void execute(Database.BatchableContext bc, List<Lead> scope) {
        for (Lead l : scope) {
            l.LeadSource = 'ManualL';
            
           count++;
        }
        update scope;
        
        system.debug(count + 'record has been updated');
    }

    public void finish(Database.BatchableContext bc) {
        // Handle any post-processing tasks here, if needed.
        
        
     
    }

}