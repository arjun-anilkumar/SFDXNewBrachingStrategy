@isTest
public class Account_Test {
     public integer n;
   public  integer k;
    
    @testSetup static void setup()
    {
        //list<Contact> clist = new list<contact>();
        //clist = [SELECT Id, LastName, FirstName, Name, OtherStreet, OtherCity, OtherState FROM Contact];
        // integer n = clist.size();
        Account a = new Account(Name='yoyo');
        insert a;
        
    }
    
      public static testMethod void check ()
     {
         list<Contact> clist = new list<contact>();
        clist = [SELECT Id, LastName, FirstName, Name, OtherStreet, OtherCity, OtherState FROM Contact ];
         integer n = clist.size();
         list<Account> alist = new list<Account>();
         for(integer i=0;i<1000;i++)
         {
            Account a = new Account(Name='yoyo'+i); 
             alist.add(a);
             
         }
       // Account a = new Account(Name='yoyo');
        insert alist;
          list<Contact> clist1 = new list<contact>();
        clist1 = [SELECT Id, LastName, FirstName, Name, OtherStreet, OtherCity, OtherState FROM Contact];
         integer k = clist1.size();
         System.assertEquals(n+1000, k);
     }

    //n=n+1
   // System.assertEquals(n, k);

}