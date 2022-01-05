public with sharing class UpdateContactBatch {
    public Database.QueryLocator start(Database.BatchableContext bc)
    {
        String query='Select id,name,title,description,Account.Name, Account.description from Contact';
        return Database.getQueryLocator(query);
    }    
    public void execute(Database.BatchableContext bc,List<Contact> contacts)
    {
     if(contacts != null)
     {
         for(Contact con: contacts)
         {
           if(con.Account.Name != null)
           {
             con.Description=con.Title + 'of' + con.Account.Name + ':' + con.Account.description; 
             System.debug(con.Description);
           }
         }
         update contacts;
         
     }
    }
    
    public void finish(Database.BatchableContext bc)
    {
        
    }
}
