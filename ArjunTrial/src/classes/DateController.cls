public class DateController {
    
    public list <Qalification__c> Qlist = new list<Qalification__c>();
    Private Date startDate = date.newInstance(0001, 1, 1);
    public String dayValue;
    
    public void check( list<Qalification__c> q)
    {
        Qalification__c qobj =new Qalification__c();
        for(Qalification__c nq : q)
        {
            DateTime dT = System.now();
            date startDate =  date.newinstance(dT.year(), dT.month(), dT.day());
            date dueDate = nq.year_of_passout__c;
            integer numberDaysDue = startDate.daysBetween(dueDate);
            if( numberDaysDue > 2)
            {
               // List<String> listDay = new List<String>{'Saturday' , 'Sunday' , 'Monday' , 'Tuesday' , 'Wednesday' , 'Thursday' , 'Friday'};  
                    datetime myDate = datetime.newInstance(nq.year_of_passout__c.year(), nq.year_of_passout__c.month(), nq.year_of_passout__c.day());
                String day = myDate.format('EEEE');
                system.debug('dayValue is333333'+day);
                if(day=='Saturday'||day=='Sunday')
                {
                    nq.adderror( 'invalid day');
                }
            }
            else
            {
                nq.adderror(' invalid date  <2');
            }
        } 
    }
    public void checkupdate( list<Qalification__c> q)
    {
        Qalification__c qobj =new Qalification__c();
        for(Qalification__c nq : q)
        {
            date startDate =  date.newinstance(nq.CreatedDate.year(), nq.CreatedDate.month(), nq.CreatedDate.day());
            date dueDate = nq.year_of_passout__c;
            integer numberDaysDue = startDate.daysBetween(dueDate);
            if( numberDaysDue > 2)
            {
               // List<String> listDay = new List<String>{'Saturday' , 'Sunday' , 'Monday' , 'Tuesday' , 'Wednesday' , 'Thursday' , 'Friday'};  
                datetime myDate = datetime.newInstance(nq.year_of_passout__c.year(), nq.year_of_passout__c.month(), nq.year_of_passout__c.day());
                String day = myDate.format('EEEE');
                system.debug('dayValue is333333'+day);
                if(day=='Saturday'||day=='Sunday')
                {
                    nq.adderror( 'invalid day');
                }
            }
            
            else
            {
                nq.adderror(' invalid date  <2');
            }
        }
    } 
}