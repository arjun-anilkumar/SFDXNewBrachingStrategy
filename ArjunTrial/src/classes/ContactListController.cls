public class ContactListController {
    
    @AuraEnabled
    public static List<Contact> findAll() {
        return [SELECT id, name, phone FROM Contact LIMIT 50];
    }
    
    @AuraEnabled
    public static List<Contact> findByName(String searchKey) {
        String name = '%' + searchKey + '%';
        system.debug('name'+searchKey);
        return [SELECT id, name, phone FROM Contact WHERE name LIKE :name LIMIT 50];
        
    } 
    @AuraEnabled
    public static Contact findById(String contactId) {
        return [SELECT id, name, title, phone, mobilephone, Account.Name
                FROM Contact WHERE Id = :contactId];
    }
    
    @AuraEnabled
    public static List<sObject> findByObj(string searchKey) {
        String name = '' + searchKey + '';
        system.debug('object name '+searchKey);
       // name = 'Lead';
        String soqlQuery =  'select Id,Name from '+name+'';
                           
       // object__c obj = database.query(soqlQuery);
       list<sObject> value = database.query(soqlQuery);
        //return [SELECT id, name, title, phone, mobilephone, Account.Name
               // FROM Contact];
         system.debug('value'+value);
         return value;
    }
}