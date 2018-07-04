/** 
* @author {Arjun Anilkumar}, Suyati
* @date {10/10/2017}
*
* @group { category this falls under. See below }
* @group-content {see ApexDoc documentation}
*
* @description {to handel interview page activities;
* - This can be split onto multiple li nes as required
* with “*” or “-” bullets, etc. }
*
* @unit-test: {name of the Class with UnitTest(s) that cover this class}
*
* @modifications:
* - {Developer FirstInit.Lastname}, {MM/DD/YYYY} – {Description of changes made 
* and why, ideally include name of client contact who requested the change}
*
*/


public class InterviewClass {
    
    public Employee_Candidate__c elist {get;set;}
    public list<Interview__c> intlist {get;set;} 
    public list<Interview__c> intlistp {get;set;} 
    public Boolean makevisible {get; set;}
    public Boolean makevisiblesec {get; set;}
    public string contIdChosen {get; set;}
    public Interview__c rlist {get;set;}
    public Interview__c rlist1 {get;set;}
    // public string req{get;set;}
    
    
    public InterviewClass()
    {
        elist = [SELECT Id, First_Name__c, Last_Name__c, Phone__c, Email__c,
                 Street__c,Years_of_Experience__c, City__c, State_Province__c, Zip_Postal_Code__c 
                 FROM Employee_Candidate__c where id= : ApexPages.currentPage().getParameters().get('Id') ];
        
        intlist = [SELECT Id, Name, Status__c, interviewer__r.First_Name__c,interviewer__r.Last_Name__c, Candidate_id__c,date_and_time__c 
                   FROM Interview__c where Candidate_id__c= : ApexPages.currentPage().getParameters().get('Id') 
                   and Status__c='finished' ];
        intlistp =[SELECT Id, Name, Status__c, interviewer__r.First_Name__c,interviewer__r.Last_Name__c, Candidate_id__c ,date_and_time__c
                   FROM Interview__c where Candidate_id__c= : ApexPages.currentPage().getParameters().get('Id') 
                   and (NOT Status__c  Like 'finished')];
        
        makevisible = true;
        makevisiblesec = false;
        // req ="request for reschedule";
        // System.debug('The value is: ' +intlist);
        
    }
    
    public void reschedule()
    {
        makevisible  = makevisible ? false:true;
        makevisiblesec  = makevisiblesec ? false:true; 
    }
    
    public void edit()
    {
        makevisible  = makevisible ? false:true;
        makevisiblesec  = makevisiblesec ? false:true; 
        // makevisible =false;
        //  makevisiblesec= true;
        
        
        rlist1=[SELECT Id, Name, Status__c, interviewer__r.First_Name__c,interviewer__r.Last_Name__c, Candidate_id__c ,date_and_time__c
                FROM Interview__c where   Name = :contIdChosen ];
        // rlist = [SELECT Id, Name, Status__c, interviewer__c, date_and_time__c FROM Interview__c where Name = :contIdChosen ];
        System.debug('The value selected interview ' +rlist );
        
    }
    
    // public pagereference updatechange()
    //{
    
    //  upsert rlist;
    //   makevisible =false;
    //  makevisiblesec= true;
    // pagereference p= new pagereference('/apex/InterviewDetails?id='+ApexPages.currentPage().getParameters().get('Id'));
    // return  p;
    // return opptypage;
    // }
    
    public void updatechange()
    {
        upsert rlist1;
        makevisible  = makevisible ? false:true;
        makevisiblesec  = makevisiblesec ? false:true; 
    }
    
    public PageReference redirectohome()
    {
        PageReference opptyPage = new PageReference('/apex/getPage');
        opptyPage.getParameters().put('id',ApexPages.currentPage().getParameters().get('Id') );
        // opptyPage.setRedirect(true);
        return opptypage;
    }
    
    public PageReference redirect()
    {
        PageReference opptyPage = new PageReference('/apex/Resume');
        opptyPage.getParameters().put('id',ApexPages.currentPage().getParameters().get('Id') );
        // opptyPage.setRedirect(true);
        return opptypage;
    }
    
    public PageReference redirecttointerview()
    {
        PageReference opptyPage = new PageReference('/apex/InterviewDetails');
        opptyPage.getParameters().put('id',ApexPages.currentPage().getParameters().get('Id') );
        // opptyPage.setRedirect(true);
        return opptypage;
    }
    public PageReference redirecttointerview1()
    {makevisible  = makevisible ? false:true;
     makevisiblesec  = makevisiblesec ? false:true;
     PageReference opptyPage = new PageReference('/apex/InterviewDetails');
     opptyPage.getParameters().put('id',ApexPages.currentPage().getParameters().get('Id') );
     // opptyPage.setRedirect(true);
     return opptypage;
    }
    
    public PageReference redirecttoposition()
    {
        PageReference opptyPage = new PageReference('/apex/openpositions');
        opptyPage.getParameters().put('id',ApexPages.currentPage().getParameters().get('Id') );
        // opptyPage.setRedirect(true);
        return opptypage;
    }
    
    
}