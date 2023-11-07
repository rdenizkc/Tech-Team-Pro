public class AccountTriggerHandlerL{
      public static void handleNewAccounts(List<Account> newAccounts) {
        
        
        List<Opportunity> oppAcc =[ SELECT Id FROM Opportunity  WHERE AccountId IN :newAccounts ] ;
        
        List<Opportunity> oppList = new List<Opportunity>();
        If (oppAcc.isEmpty()){
            for (Account acc : newAccounts) {
                
                Opportunity opp = new Opportunity();
                opp.Name = acc.Name + ' Opportunity';
                opp.StageName = 'Prospecting';
                opp.CloseDate = Date.today().addMonths(1);
                opp.AccountId = acc.Id;
                oppList.add(opp);
                
                
            }
        }       
        
       if (!oppList.isEmpty()) {
            insert oppList;
        }
        
    }
    
    
}