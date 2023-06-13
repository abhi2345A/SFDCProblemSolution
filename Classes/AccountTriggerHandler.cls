public class AccountTriggerHandler{
  
    public static void AfterInsert(List<Account> newItems){
               
        AccountTriggerHandlerUtil.insertTasks(newItems);
    }
    
}