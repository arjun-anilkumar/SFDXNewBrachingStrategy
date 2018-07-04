public class Check {
    public string str{get;set;}
    public list<Position__c> newlist {get;set;}
    
    public check()
    {
        str='arjun';
       // newlist =  [SELECT Id, Name, ShippingAddress, AccountNumber FROM Account];
        newlist = [SELECT  OwnerId, Name FROM Position__c];
        System.debug('list'+newlist);
        //[SELECT Id, Name, ShippingAddress, AccountNumber FROM Account]
        //
        //insert newlist;
    }

}