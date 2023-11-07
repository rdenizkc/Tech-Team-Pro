trigger CaseTriggerL on Case (before insert) {
    if(Trigger.isBefore && Trigger.isInsert){
        
        CaseTriggerHandlerL.updateCaseWithParentId(Trigger.New);
        
    }
}