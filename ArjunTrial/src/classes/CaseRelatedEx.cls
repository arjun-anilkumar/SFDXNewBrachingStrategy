public class CaseRelatedEx {
    public list<lead> leadlist = new list<lead>();
    public list<EmailMessage> email {get;set;}
    public list<case> caselist =  new list<case>();
    public id lid;
    public string emailid;
    public CaseRelatedEx(ApexPages.StandardController stdController)
    {   
        caselist=[SELECT Id, Lead__c FROM Case where id= : ApexPages.currentPage().getParameters().get('Id')];     
        for(case c:caselist)
        {
            lid=c.Lead__c;        
        }
        
        leadlist = [SELECT Id, LastName, FirstName, Email FROM Lead ];
        for(lead l:leadlist)
        {
          emailid=l.Email;  
        }
        email = [SELECT Id, Subject, FromName, ToAddress, MessageDate FROM EmailMessage where ToAddress =: emailid ];
        
        

    }
    
    
}