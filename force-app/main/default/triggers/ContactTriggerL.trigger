trigger ContactTriggerL on Contact(after insert, after update, after delete, after undelete){
    
    if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUndelete){
            contactTriggerHandlerclass1.activeContacts(trigger.new);
        }
        if(trigger.isUpdate){
            contactTriggerHandlerclass1.updateContacts(trigger.new, trigger.oldMap);   
        }
        if(trigger.isDelete){
            contactTriggerHandlerclass1.deleteContacts(trigger.old) ;
        }
    }
    
    
}