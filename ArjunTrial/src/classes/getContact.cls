@RestResource(urlMapping='/v1/getContacts/*')
global with sharing class getContact {
    @Httpget
    global static string fetchAccount(){
        RestRequest req = RestContext.request;
        system.debug('req!!'+req);
        RestResponse res = Restcontext.response;
        system.debug('res!!'+res);
        Id accId = req.requestURI.substring(req.requestURI.lastIndexOf('/')+1);
        // list<contact> lstcontact =[Select id , name,Phone,Fax,Email from contact where Accountid=:accId ];
        list<Account>  lstAccounts = [SELECT Id, Name, (Select id , FirstName, LastName,name,Phone,Fax,Email from contacts) FROM Account WHERE Id = :accId LIMIT 1];
        // System.debug('list###'+lstAccounts);
        WrapperIntStringDisplayClass obj = new WrapperIntStringDisplayClass();
        //list<wrapper>  ReturnAccounts= obj.getLstwrapperIntString(lstAccounts);
        string jasonstring = obj.getLstwrapperIntString(lstAccounts);
        return jasonstring ;
    }
    public  class WrapperIntStringDisplayClass {
        
        public List<wrapper> lstw = new List<wrapper>();
       
        wrapper obj = new wrapper();
        public list<wrapper.Rcontact> conlist = new list<wrapper.Rcontact>();
        //obj.RContacts = new List<wrapper.RContact>();
        public string getLstwrapperIntString(list<Account>alist) {  
            
            for(account a :alist)
            {
                obj.accountID = a.id;
                obj.accountName = a.Name;
                system.debug('clist'+a.contacts);
                for(Contact c: a.contacts)
                {
                     wrapper.RContact  lineItem1 = new wrapper.RContact();
                    lineItem1.contactID = c.id;
                    lineItem1.contactfName = c.FirstName;
                    lineItem1.contactLName = c.LastName;
                    conlist.add(lineItem1);
                }
                obj.clist = conlist;
                lstw.add(obj);
                
                system.debug('final list@@@'+lstw);
                system.debug('final serializedlist@@@'+JSON.serialize(lstw));    
            }
            return JSON.serialize(lstw);    
        }
        
    }
    
}