@istest
public class getClass_Test {
    
    
     @testSetup static void setup()
     {
          Employee_Candidate__c e = new Employee_Candidate__c();
        e.City__c='eranakulam';
        e.Country__c='india';
        e.Last_Name__c='kumar';
        e.First_Name__c='raj';
        insert e;
         
     }
    
    
    
    public testmethod static void positiveTest()
    {
        
       
       

        
        
        PageReference pageRef = Page.getPage;
         Test.setCurrentPage(pageRef);
       // getClass controller = new getClass();
       /* Employee_Candidate__c e = new Employee_Candidate__c();
        e.City__c='eranakulam';
        e.Country__c='india';
        e.Last_Name__c='kumar';
        e.First_Name__c='raj';
        insert e;*/
        Employee_Candidate__c e = new Employee_Candidate__c();
        e =[select id from Employee_Candidate__c where City__c='eranakulam'];
        
          ApexPages.currentPage().getParameters().put('id', e.id);
        getClass g = new getClass();
        
        
 
       
      //  g.getClass();
        g.redirecttointerview();
        g.redirecttoposition();

    }

}