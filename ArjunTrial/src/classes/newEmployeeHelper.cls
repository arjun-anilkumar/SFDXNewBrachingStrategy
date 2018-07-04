public class newEmployeeHelper {
    
    public string str;
    public list <Employee_Candidate__c> elist =new list<Employee_Candidate__c>();
    public list <Job_Application__c> jlist{get;set;}  
    public  Employee_Candidate__c elistq = new Employee_Candidate__c ();
    public Job_Application__c jlistq = new Job_Application__c();
    Employee_Candidate__c[] accts = new List<Employee_Candidate__c>();
    public list<Qalification__c> qlist = new list<Qalification__c>();

    
    
    public newEmployeehelper()
    {
        str='Hired';
    }
    
    public void insertEmployee(list<Job_Application__c> njlist )
    {
        for(Job_Application__c j : njlist)
        {
            if(j.Status__c=='Hired')
            {
                jlistq = [SELECT Name, Id, CreatedDate, Candidate__c, Position__c, Status__c FROM Job_Application__c where Id=: j.Id ];
                elistq=[SELECT Id, First_Name__c, Last_Name__c, Phone__c, Email__c,
               Street__c,Years_of_Experience__c, City__c, State_Province__c, Zip_Postal_Code__c ,Country__c
               FROM Employee_Candidate__c where id=:jlistq.Candidate__c];
                qlist = [SELECT university__c, year_of_passout__c, name__c, Name, Id FROM Qalification__c 
                         where id=:jlistq.Candidate__c ];
                Employee_Candidate__c e= new Employee_Candidate__c();
                e.First_Name__c=elistq.First_Name__c;
                e.City__c = elistq.City__c;
                e.Country__c = elistq.Country__c;
                elist.add(e);
                
                for (Integer i = 0; i < qlist.size(); i++) 
                {
				    //e.Qualification__c =qlist.
				}
                
                //accts.add(elistq);
                //elist=accts;
                      	
            
            }
        }
        insert (elist);
        
    }

}