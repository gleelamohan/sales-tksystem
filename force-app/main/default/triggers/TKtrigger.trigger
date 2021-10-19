trigger TKtrigger on Case (after insert) {
    
     for (Case c : Trigger.New) {
         
         string accountName = '';
         if(!String.isBlank(c.accountid))
         {
             
             Account a = [select Name from Account where Id = :c.accountid];
             accountName = a.Name;
             
         }
         
    	TKCaseCreation.createCase(c.caseNumber, c.subject, c.description, c.status,accountName,c.Id);
  }

}