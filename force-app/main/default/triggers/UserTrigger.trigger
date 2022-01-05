trigger UserTrigger on SOBJECT (before insert,before update,before delete,after insert,after update,after delete) {
    if(Trigger.isAfter && Trigger.isInsert)
    {
        set<Id> userIds=new set<Id>();
      Profile legalProfile=[Select Id,Name FROM Profile WHERE Name = 'Custom: Marketing Profile' LIMIT 1];
        
        for(User use:Trigger.new)
        {
            if(use.ProfileId == legalProfile.Id)
            {
                userIds.add(use.Id);
            }
        }
        UserTriggerHandler.assignPermissionSetToLegalProfileUsers(userIds);
    }
}