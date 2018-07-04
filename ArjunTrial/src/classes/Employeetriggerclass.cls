public class Employeetriggerclass {
    
    public list<id> emplist= new list<id>();
    public list <Employee_Candidate__c> elist = new list <Employee_Candidate__c>();
    public list <Employee_Candidate__c> elist1 = new list <Employee_Candidate__c>();
    public list<id> qlist =new list<id>();
    public list<Qalification__c> qalist = new list <Qalification__c>();
    public list<Qalification__c> qalist1 = new list <Qalification__c>();
    public list<Experience__c> exlist = new list <Experience__c>();
    public list<Experience__c> exlist1 = new list <Experience__c>();
       
    
    public void  EmployeeidNew(map<id,Job_Application__c> m7  , map<id,Job_Application__c> m5)
     {          
        for (id key :m7.keyset())  
        {
            Job_Application__c j= new Job_Application__c();
            Job_Application__c nj= new Job_Application__c();
           j= m7.get(key);
           nj=m5.get(key);
            if(j.Status__c!=nj.Status__c )
            {
                emplist.add(j.Candidate__c);
            }          
        }
         System.debug('emplist'+emplist);
         
         elist = [ SELECT Id, OwnerId, IsDeleted, Name, RecordTypeId, First_Name__c, Last_Name__c, Phone__c, 
                 Email__c, Street__c, City__c, State_Province__c,Zip_Postal_Code__c, Country__c, Current_Employer__c, 
                 Years_of_Experience__c, designation__c FROM Employee_Candidate__c where id IN :emplist];
        
        qalist =[SELECT Id, IsDeleted, Name, LastActivityDate, SystemModstamp, university__c,
             year_of_passout__c, name__c FROM Qalification__c where name__c  IN :emplist];
        exlist =[SELECT Name, Employee_or_Candidate__c, skill_set__c, years_of_experience__c, 
                 specification__c, Id FROM Experience__c where Employee_or_Candidate__c IN :emplist];
         
         for( Employee_Candidate__c q : elist )  
        {
            Employee_Candidate__c e = new Employee_Candidate__c();
            e.City__c= q.City__c;
            e.First_Name__c=q.First_Name__c;
            
            elist1.add(e);
         }
         insert elist1;
         
         
        Map<id, id> m1 = new Map<id, id>();
	    integer i =0;
        for(Employee_Candidate__c q:elist1)
        {
             m1.put(emplist[i], q.Id);
             system.debug('value map '+m1);
            i++;

        }
        
                 
          for (id key :m1.keyset())  
        {
            for( Qalification__c qual:qalist)
            {
                  if(qual.name__c == key)
                  {
                    Qalification__c newqual = new Qalification__c();
                     newqual.Name = qual.Name;
                     newqual.university__c = qual.university__c; 
                       newqual.year_of_passout__c = qual.year_of_passout__c;
                      newqual.name__c = m1.get(key);
                      qalist1.add(newqual);
                  }
       
            }    
        }
            insert(qalist1);
        
         System.debug('newfff experience '+exlist);
         for (id key :m1.keyset())  
        {
            for( Experience__c ee:exlist)
            {
                if(ee.Employee_or_Candidate__c==key)
                {
                    Experience__c newe= new Experience__c();
                    newe.Name = ee.Name;
                    newe.specification__c = ee.specification__c;
                    newe.years_of_experience__c = ee.years_of_experience__c;
                    newe.Employee_or_Candidate__c = m1.get(key);
                    exlist1.add(newe);
                    System.debug('new experience '+newe);
                }
                
       
            }    
        }
            insert(exlist1);
         
         
     }
    
    
    
 
    
}