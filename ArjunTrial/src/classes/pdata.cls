public class pdata {
    public Employee_Candidate__c elist {get;set;}
    public string name;
    public list< Qalification__c> qlist{get;set;}
    public list<experience__c> xlist{get;set;}
    public Boolean isEditable {get; set;}
    public Boolean isNotEditable {get; set;}
    public Boolean isEditableper {get; set;}
    public Boolean isNotEditableper {get; set;}
    public Boolean isEditableq {get; set;}
    public Boolean isNotEditableq {get; set;}
    public Boolean isEditables {get; set;}
    public Boolean isNotEditables {get; set;}
    public Boolean isEditablec {get; set;}
    public Boolean isNotEditablec {get; set;}
    public Boolean add {get; set;}
    public Boolean adde {get; set;}
    public Boolean isEditableB {get; set;}
    
    public list<Qalification__c> addnew = new list<Qalification__c>();
    public string value;   
    public Qalification__c qu {get{if(qu==null)
        qu = new Qalification__c ();
                                   return qu;}set;}    
    public Experience__c exq {get{if(exq==null)
        exq = new Experience__c ();
                                  return exq;}set;}        
    Attachment photo = new Attachment();
    public String imageURL{get;set;}
    public pdata()
    {
        photo =  [SELECT Id, Name, Body, ContentType FROM Attachment WHERE Parentid = : ApexPages.currentPage().getParameters().get('Id')];
        
        imageURL='/servlet/servlet.FileDownload?file='+photo.Id;
        
        elist = [SELECT Id, First_Name__c, Last_Name__c, Phone__c, Email__c,
                 Street__c,Years_of_Experience__c, City__c, State_Province__c, Zip_Postal_Code__c 
                 FROM Employee_Candidate__c where id= : ApexPages.currentPage().getParameters().get('Id') ];
        //name = [SELECT First_Name__c  FROM Employee_Candidate__c where First_Name__c='mary' ];
        qlist=[SELECT  Name, university__c, year_of_passout__c FROM Qalification__c 
               where 	name__c= : ApexPages.currentPage().getParameters().get('Id')];
        xlist=[SELECT Id, Employee_or_Candidate__c, skill_set__c, years_of_experience__c,company__c, Name FROM Experience__c where
               Employee_or_Candidate__c=: ApexPages.currentPage().getParameters().get('Id')];
        isEditable = true;
        isNotEditable = false;
        isEditableper = true;
        isNotEditableper = false;
        isEditableq = true;
        isNotEditableq = false;
        isEditables = true;
        isNotEditables = false;
        isEditablec = true;
        isNotEditablec = false;
        add = false;
        adde = false;
        isEditableB =false;    
        value =ApexPages.currentPage().getParameters().get('Id') ;
    }
    public void changeEditable(){
        isEditable = isEditable ? false:true;
        isEditableB =true;    
        //isNotEditable = isNotEditable ? false:true; 
    }
    public void changeEditableBak(){
        isEditable = isEditable ? false:true;
        isEditableB =false;       
    }
    public void changeEditableper(){
        isEditableper = isEditableper ? false:true;
        isNotEditableper = isNotEditableper ? false:true; 
    }   
    public void changeEditableq(){
        isEditableq = isEditableq ? false:true;
        isNotEditableq = isNotEditableq ? false:true; 
    }
    public void changeEditables(){
        isEditables = isEditables ? false:true;
        isNotEditables = isNotEditables ? false:true; 
    }
    public void changeEditablec(){
        isEditablec = isEditablec ? false:true;
        isNotEditablec = isNotEditablec ? false:true; 
    }   
    public void updatechange()
    {
        upsert qlist;
        System.debug('elist'+qlist);
    }
    public void updatechangeEx()
    {
        upsert xlist;
        System.debug('elist'+xlist);
    }   
    public PageReference redirectohome()
    {
        PageReference opptyPage = new PageReference('/apex/getPage');
        opptyPage.getParameters().put('id',ApexPages.currentPage().getParameters().get('Id') );
        return opptypage;
    }   
    public PageReference redirect()
    {
        add = add ? false:true;
        PageReference opptyPage = new PageReference('/apex/Resume');
        opptyPage.getParameters().put('id',ApexPages.currentPage().getParameters().get('Id') );       
        return opptypage;
    }
    
    public PageReference redirect1()
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
    
    public void addq()
    {
        add = add ? false:true;
    }    
    public void addqe()
    {
        adde = add ? false:true;
    }
    
    public pagereference addnew()
    {
        qu.name__c= value;
        insert qu;        
        PageReference opptyPage = new PageReference('/apex/Resume');
        opptyPage.setRedirect(true);
        opptyPage.getParameters().put('id',ApexPages.currentPage().getParameters().get('Id') );       
        return opptypage;
    }
    public pagereference addnewex()
    {
        exq.Employee_or_Candidate__c= value;
        insert exq;       
        PageReference opptyPage = new PageReference('/apex/Resume');
        opptyPage.setRedirect(true);
        opptyPage.getParameters().put('id',ApexPages.currentPage().getParameters().get('Id') );        
        return opptypage;
    }
    
    
}