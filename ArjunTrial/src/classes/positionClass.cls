public class positionClass {  
    public list<Employee_Candidate__c> employeeList{get;set;}
    public list<Position__c>positionList {get;set;}
    public integer total_size;
    public id contIdChosen {get; set;}
    public id candidateid;
    public list< Job_Application__c> newJobApplication = new list<Job_Application__c>();
    public list<Job_Application__c> jobApplicationList {get;set;}
    public list<Job_Application__c> newJobApplicationList {get;set;}
    public list<id> jid = new list<id>();
    public string cid;
    public positionclass()
    {
        candidateid = ApexPages.currentPage().getParameters().get('Id');
        total_size = [select count() from Position__c];
        employeeList=[SELECT Id, First_Name__c, Last_Name__c, Phone__c, Email__c,
               Street__c,Years_of_Experience__c, City__c, State_Province__c, Zip_Postal_Code__c 
               FROM Employee_Candidate__c where id= : ApexPages.currentPage().getParameters().get('Id')];
        cid = ApexPages.currentPage().getParameters().get('Id');
        jobApplicationList = [SELECT Status__c, Position__c, Candidate__c, Name, Id, CreatedDate
                 FROM Job_Application__c ];
        newJobApplicationList = [SELECT Status__c, Position__r.name, Candidate__c, Name, Id, CreatedDate
                  FROM Job_Application__c where Candidate__c = :  ApexPages.currentPage().getParameters().get('Id') ];
        for(Job_Application__c j:jobApplicationList)
        {
            if(j.Candidate__c== cid)
            {
                jid.add(j.Position__c);
            }
        }
        
        positionList=[SELECT Id, Name, Job_Description__c, Responsibilities__c, Min_Pay__c,
               Max_Pay__c, Open_Date__c, Functional_Area__c FROM Position__c where Status__c = 'Open - Approved' and 
               id not in :jid];      
    }
    
    public pagereference applyjob()
    {
        system.debug('candidateid='+candidateid);
        system.debug('positionname == '+contIdChosen);
        id pname = contIdChosen;
        system.debug('name = '+pname);
        Job_Application__c j = new Job_Application__c();       
        j.Candidate__c = candidateid;
        j.Position__c = pname;
        system.debug('candidateid='+j.Candidate__c);
        system.debug('positionname == '+j.Position__c);
        newJobApplication.add(j);
        system.debug('newJobApplication='+newJobApplication);       
        insert newJobApplication;    
        PageReference opptyPage = new PageReference('/apex/openpositions');
        opptyPage.setRedirect(true);
        opptyPage.getParameters().put('id',ApexPages.currentPage().getParameters().get('Id') );
        return opptypage;        
    }
    
    public PageReference redirectohome()
    {
        PageReference opptyPage = new PageReference('/apex/getPage');
        opptyPage.getParameters().put('id',ApexPages.currentPage().getParameters().get('Id') );       
        return opptypage;
    }
    
    public PageReference redirect()
    {
        PageReference opptyPage = new PageReference('/apex/Resume');
        opptyPage.getParameters().put('id',ApexPages.currentPage().getParameters().get('Id') );       
        return opptypage;
    }
    
    public PageReference redirecttointerview()
    {
        PageReference opptyPage = new PageReference('/apex/InterviewDetails');
        opptyPage.getParameters().put('id',ApexPages.currentPage().getParameters().get('Id') );        
        return opptypage;
    }
    
    public PageReference redirecttoposition()
    {
        PageReference opptyPage = new PageReference('/apex/openpositions');
        opptyPage.getParameters().put('id',ApexPages.currentPage().getParameters().get('Id') );       
        return opptypage;
    }   
    
}