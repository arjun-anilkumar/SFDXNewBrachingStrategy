public class SubjectTriggerHelper {
    
    list <case> elist = new list<case>();
    list <case> clist = new list<case>();
    list<id> idlist =new list<id>();
    map<id,string> emap = new map<id,string>();
    public void SubjectFill(list<EmailMessage> c)
    {
        System.debug('gghghhghhg');
        case cobj = new case();
        for(EmailMessage c1 : c)
        {
            system.debug('id****'+c1.Id);
            idlist.add(c1.RelatedToId);
        }
        system.debug('idleis'+idlist);
        elist = [SELECT Id FROM case where Id in:idlist];
       system.debug('elist****'+elist);
        for(EmailMessage e1 : c)
       {
           emap.put(e1.RelatedToId, e1.Subject);
       }
        system.debug('map***'+emap);
       for(case c1 : elist)
       {
           cobj.Id= c1.id;
           cobj.NewSubject__c = emap.get(c1.id);
           clist.add(cobj);
           system.debug('obj'+cobj);
       }
        update clist;
           
    }

}