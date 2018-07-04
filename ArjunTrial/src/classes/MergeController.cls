public class MergeController {
    public list<MergeObj__c> m1 = new list<MergeObj__c>();
    public list<MergeObj__c> dupelist = new list<MergeObj__c>();
    public list<string> namelist = new list <string>();
    public integer flag=0; 
    public list<id> acclist = new list <id>();
    public integer flagacc=0;
    public MergeController()
    {
        m1=[SELECT Id, Name, Account_ID__c, Business_Phone__c, Contact_Type__c, Email__c, Email_Opt_Out__c, Full_Name__c, HubSpot_Score__c, Mailing_Country__c FROM MergeObj__c];
        namelist[0]='fffffasffsf';
        acclist[0] = '0001010wwe31';
    }
    
    public void FullName()
    {
        for(MergeObj__c mlist:m1)
        {
           checkinstring(mlist.Full_Name__c) ;//calling function to know if the name has been concidered
            if(flag!=1)
            {
                namelist.add(mlist.Full_Name__c);
                dupelist(mlist.Full_Name__c);
            }
        }
    }
    
    public void checkinstring(string a)//to check if the name is in the list
    {
        for(integer i=0;i < namelist.size();i++)
        {
            if(namelist[i] == a )
            {
                flag=1;
            }
        }
    }

    public void dupelist(string a)//duplicate elements are put into the new list
    {
        MergeObj__c mobject = new MergeObj__c();
        for(MergeObj__c mlist:m1)
        {
           mobject.Account_ID__c = mlist.Account_ID__c;
            mobject.Full_Name__c = mlist.Full_Name__c;
            mobject.Email__c=mlist.Email__c;
            mobject.Business_Phone__c=mlist.Business_Phone__c;
            mobject.Contact_Type__c=mlist.Contact_Type__c;
            mobject.HubSpot_Score__c=mlist.HubSpot_Score__c;
            mobject.Id=mlist.Id;
           dupelist.add(mobject);
        }
        getaccountid(dupelist);
    }
    
    public void getaccountid(list<MergeObj__c> m2)
    {
        for(MergeObj__c m3:m2)
        {
            checkid(m3.Account_ID__c);
            if(flagacc!=1)
            {
                acclist.add(m3.Account_ID__c);
                dupelist(m3.Full_Name__c);
            }
        }
    }
    
    public void checkid( id accid)
    {
         for(integer i=0;i < acclist.size();i++)
        {
            if(acclist[i] == accid )
            {
                flagacc=1;
            }
        }
    }
}