public class FetchDataLightning {
    @AuraEnabled
    public static List<contact> get10COntacts()
    {
        list <Contact> clist = new list<Contact>();
        clist = [SELECT Id, NAME FROM Contact Limit 10] ;
        
        return [SELECT Id, NAME FROM contact Limit 10] ;
    }
}