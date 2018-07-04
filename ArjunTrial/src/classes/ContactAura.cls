public class ContactAura {
    @AuraEnabled
    public static List<Contact> get10COntacts()
    {
       list <Contact> clist = new list<Contact>();
        clist = [SELECT Id, NAME FROM Contact Limit 10] ;
        
        return [SELECT Id, NAME FROM Contact Limit 10] ;
    }
}