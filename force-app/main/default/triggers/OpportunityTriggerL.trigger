trigger OpportunityTriggerL on Opportunity (after update) {
    If(Trigger.isAfter && Trigger.isUpdate){
        OpportunityTriggerHandlerL.OppClosedWonTask(Trigger.new,trigger.oldMap);
    }

}