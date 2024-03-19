trigger AccountTrigger on Account (after insert) {
	AccountTriggerHandler handler = new AccountTriggerHandler();
    
    if(Trigger.isInsert && Trigger.isAfter) {
        handler.handleAfterInsert(Trigger.new);
    }
}