trigger TaskTrigger on Task (after update) {

    System.debug('Task Trigger');
    
    if(Trigger.isAfter && Trigger.Update){
        TaskTriggerHandler.AfterUpdate(Trigger.New,Trigger.oldMap);
    }
}
