public class getClass {
    public string name;
    public Employee_Candidate__c EmployeeList {get;set;}
    public String strName {get;set;}
    public Boolean isEditable {get; private set;}
    Attachment photo = new Attachment();
    public String imageURL{get;set;}
    public getclass()    
    {
        EmployeeList = [SELECT Id, Name, First_Name__c, Phone__c, Last_Name__c, Email__c, 
                 Street__c, City__c, State_Province__c, Zip_Postal_Code__c, Country__c,
                 Years_of_Experience__c, Current_Employer__c, designation__c, Qualification__c 
                 FROM Employee_Candidate__c WHERE Id = :ApexPages.currentPage().getParameters().get('Id')];
        photo =  [SELECT Id, Name, Body, ContentType FROM Attachment WHERE Parentid = : ApexPages.currentPage().getParameters().get('Id')];
        imageURL='/servlet/servlet.FileDownload?file='+photo.Id;
        
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