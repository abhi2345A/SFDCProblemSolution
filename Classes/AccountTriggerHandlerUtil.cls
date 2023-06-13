public class AccountTriggerHandlerUtil {
    
    public static void insertTasks(List<Account>accList){
        
        List<Task>taskList = new List<Task>();
        for(Account ac : accList){
            Task tsk = new Task();
            tsk.Subject = 'Review Account-'+ac.AccountNumber;
            tsk.ActivityDate = System.today().addDays(7);
            tsk.Status = 'Not Started';
            tsk.OwnerId = ac.OwnerId;
            tsk.whatId = ac.Id;
            taskList.add(tsk);
        }
        
        if(!taskList.isEmpty()){
            insert taskList;
        }
    }
}