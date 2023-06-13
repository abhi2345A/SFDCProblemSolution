trigger TaskTrigger on Task (after update) {

    System.debug('Task Trigger');
    
    if(Trigger.isAfter && Trigger.isInsert){
        TaskTriggerHandler.AfterUpdate(Trigger.New,Trigger.oldMap);
    }
}