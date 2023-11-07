trigger AccountTriggerL on Account (after insert,after update) {
 if (Trigger.isAfter) {
        if (Trigger.isInsert ||Trigger.isUpdate){
            // Handle new Account creation
            AccountTriggerHandlerL.handleNewAccounts(Trigger.new);
        }
       
    }
}