public with sharing class UserTriggerHandler {
    @future
    public static void assignPermissionSetToLegalProfileUsers(Set<Id> userIds)
    {
      Permissionset pset =[SELECT Id,Name FROM Permissionset WHERE Name='Marketing_User_Permissions' LIMIT 1];
        List<PermissionSetAssignment> newPermissions=new List<PermissionSetAssignment>();
        for(Id useId: userIds)
        {
            PermissionSetAssignment opsetassign=new PermissionSetAssignment();
            opsetassign.PermissionSetId=pset.Id;
            opsetassign.AssigneeId=useId;
            newPermissions.add(opsetassign);
            
                    }
        if(newPermissions != null)
        {
          insert newPermissions;  
        }
}
