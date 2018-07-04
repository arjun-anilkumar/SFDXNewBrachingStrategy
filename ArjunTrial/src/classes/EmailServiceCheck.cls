public class EmailServiceCheck {
    public list<MergeObj__c> mergelist = new list<MergeObj__c>();
    public list<EmailMessage> email {get;set;}
    public boolean visible{get;set;}
   
    public string name;
    public EmailServiceCheck(ApexPages.StandardController stdController)
    {   
        visible=true;
        mergelist = [SELECT  Id, Name, Full_Name__c FROM MergeObj__c where id= : ApexPages.currentPage().getParameters().get('Id')];     
        for(MergeObj__c c:mergelist)
        {
               name = c.Name;    
        }
        
       // caselist = [SELECT Id, Subject, ToAddress, FromAddress FROM EmailMessage where Subject= : name ];
       
        email = [SELECT Id, Subject, FromName, ToAddress, MessageDate FROM EmailMessage where Subject= : name ];
        
        if(email.size()==0)
        {   system.debug('visible'+visible);
            visible = false;
        }

    }
    
    

}