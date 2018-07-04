public class renderClass {
    
    //public list<Position__c> newp = [SELECT Id, Name FROM Position__c where name ='reader'];
    public list<Position__c> newp = new list<Position__c>(); 
    public LIST<Position__c> getselectdata()
    {
         newp = [SELECT Id, Name FROM Position__c where name ='reader'];
         return newp;
    }
    
   
}