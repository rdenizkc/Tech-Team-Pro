public class CaseTriggerHandlerL {

  public static void updateCaseWithParentId(List<Case> newCases){
        Set<Id> setAccount = new Set<Id>();//creates a set of Account Ids that are associated with the new Case records
        Map<Id, list<Case>> accountToCase = new Map<Id, list<Case>>();//store the related Case records for each Account in a map where the Account Id is the key.
              
      
      for(Case c : newCases){ 
            if(String.isNotBlank(c.AccountId)){
                setAccount.add(c.AccountId);}
          
        }
        List<Account> lstAccount = [SELECT Id, 
                                    (SELECT Origin, ParentId, AccountId FROM Cases ORDER BY CreatedDate DESC) 
                                    FROM Account WHERE Id IN :setAccount];
        //Query the Account records with those Ids and retrieves all the related Case records using a nested subquery.
                  for(Account a : lstAccount){
                           accountToCase.put(a.Id, a.Cases);
        }
                for(Case c : newCases){
                    if(String.isNotBlank(c.AccountId)){
               for(case oldCase : accountToCase.get(c.AccountId)){
                    if((c.Origin == oldCase.Origin)){       
                        c.ParentId = oldCase.Id;
                                  break;
  //Finally, for each new Case record, the trigger handler looks up the related Account's Cases and finds the most recent Case record with the same Origin value. 
  //It then sets the new Case record's ParentId to the Id of the matching Case record.
                    }
                }
            }
        }
    }
}