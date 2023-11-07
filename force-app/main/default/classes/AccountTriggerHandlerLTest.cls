@isTest
public class AccountTriggerHandlerLTest {
    @isTest
    public static void createRelatedOppTest(){
        List <Account>accList=new List<Account>();
        
        For(Integer i=1;i<5;i++){
            Account acc=new Account();
            acc.Name='Test'+i;
            accList.add(acc);
        }
         Test.startTest();
        insert accList;
        Test.stopTest();
        
         List<Opportunity> oppList = [SELECT Id FROM Opportunity WHERE AccountId =:accList[1].Id];
       
        System.assert(oppList!=null,'Opp is not created');
       
    }
}