@isTest
public class AccountTriggerTest {
	@isTest
    static void testMethod1(){
        Account acc = new Account(Name = 'Test Account',AccountNumber='1235531');
        
        insert acc;
        
        Task tsk = [Select Id,Subject,ActivityDate,Status,OwnerId,whatId from task where whatId=:acc.Id];
        system.debug(tsk);
        
        System.assertEquals('Review Account-' + acc.AccountNumber, tsk.Subject);
        System.assertEquals(System.today().addDays(7), tsk.ActivityDate);
        System.assertEquals('Not Started', tsk.Status);
    }
}