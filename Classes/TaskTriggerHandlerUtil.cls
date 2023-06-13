public class TaskTriggerHandlerUtil {
    
    public static void updateTasks(List<Task> newItems,Map<Id,Task>oldItemsMap){
        
        List<Account> accountsToUpdate = new List<Account>();
        Set<Id>accIds = new Set<Id>();
        Set<Id> completedTaskIds = new Set<Id>();
        for (Task task : newItems) {
            Task oldTask = oldItemsMap.get(task.Id);
            if (task.Status == 'Completed' && oldTask.Status != 'Completed') {
                completedTaskIds.add(task.Id);
                accIds.add(task.whatId);
            }
        }
        
        Map<Id, Account> accountsMap = new Map<Id, Account>([SELECT Id, Active__c, Description FROM Account WHERE Id IN :accIds]);
        Boolean isAssigned = [SELECT COUNT() FROM PermissionSetAssignment WHERE AssigneeId = :UserInfo.getUserId() AND PermissionSet.Name = 'CQ Account Admin'] > 0;
        
        if(isAssigned){
            for (Task task : newItems) {
                if (task.Subject.startsWith('Review Account- ')) {
                    Account associatedAccount = accountsMap.get(task.WhatId);
                    
                    if (associatedAccount != null) {
                        associatedAccount.Active__c = true;
                        
                        if (String.isNotBlank(task.Description)) {
                            if (String.isBlank(associatedAccount.Description)) {
                                associatedAccount.Description = task.Description;
                            } else {
                                associatedAccount.Description += '\n' + task.Description;
                            }
                        }
                        
                        accountsToUpdate.add(associatedAccount);
                    }
                }
            }
            
            // Save the changes to the Account records
            if (!accountsToUpdate.isEmpty()) {
                update accountsToUpdate;
            }
        }
    }
}
