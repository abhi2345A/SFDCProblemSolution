trigger AccountTrigger on Account (after insert) {
	System.debug('Account Trigger');
    
    if(Trigger.isAfter && Trigger.isInsert){
        AccountTriggerHandler.AfterInsert(Trigger.New);
    }
}