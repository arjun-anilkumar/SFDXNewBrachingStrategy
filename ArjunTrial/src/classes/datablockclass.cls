public class datablockclass {
    public Employee_Candidate__c elist {get;set;}
    
    public datablockclass()
    {
        System.debug('ID@@@'+ApexPages.currentPage().getParameters().get('Id'));
         elist = [SELECT Id, First_Name__c, Last_Name__c, Phone__c, Email__c,
               Street__c,Years_of_Experience__c, City__c, State_Province__c, Zip_Postal_Code__c 
               FROM Employee_Candidate__c where id= : ApexPages.currentPage().getParameters().get('Id') ];
    }

}