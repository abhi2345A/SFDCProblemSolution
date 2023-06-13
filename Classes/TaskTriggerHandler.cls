public class TaskTriggerHandler {
	
      public static void AfterUpdate(List<Task> newItems,Map<Id,Task>oldItemsMap){
               
        TaskTriggerHandlerUtil.updateTasks(newItems,oldItemsMap);
    }
}