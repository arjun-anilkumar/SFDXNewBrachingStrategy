public class newvehicleclass {
    
   
    
    public list <vehicleChild__c> vlisttwo = new list <vehicleChild__c>();
    public list <vehicleChild__c> vlistfour = new list<vehicleChild__c>();
    public list< Vehicle__c> vlist = new list<Vehicle__c>();
    public list< Vehicle__c> vlist1 = new list<Vehicle__c>();
    public list<id> twowheelerlist = new list<id>();
    public list<id> fourwheelerlist = new list<id>();
    public list<id> alist = new list<id>();
    public list<id> alist1 = new list<id>();
   // public vehicleInsertClass()
   /// {
     //    vlist = [SELECT Id, Name, count__c FROM Vehicle__c];
    //}
    
    public void getvid( list<vehicleChild__c> vchlist)
    {
        //System.debug('.new'+vchlist);
        for( vehicleChild__c c: vchlist)
        {
           alist.add(c.type__c);
        }
        
        map <id,integer> m1 = new map<id,integer>();
        for (integer i=0;i<alist.size();i++)
        {
            id k = alist[i];
            integer count=0;
            for(integer j=0;j<alist.size();j++)
            {
                
                if(alist[j]==k)
                {
                    count=count+1;
                }
                
            }
             m1.put(k, count);
            system.debug('mapped id and count '+m1);
        }
        
        
        vlist = [SELECT Id, Name, count__c FROM Vehicle__c where id in: alist];
        //System.debug('.new'+vlist);
       for (id key :m1.keyset())  
        {
        	for(Vehicle__c v:vlist)
        	{
                //for(vehicleChild__c v1: vchlist)
                //{
                   // if(v1.type__c==v.Id)
                   // {
                        if(v.Id==key)
                        {
                            v.count__c= v.count__c + m1.get(key);
                        }
                   // }
                    
                    
                //}
            
              vlist1.add(v);  
        	}
        }
        update vlist1;
    }
            
 
    
     public void delvid( list<vehicleChild__c> vchlist)
    {
        System.debug('.new'+vchlist);
        for( vehicleChild__c c: vchlist)
        {
           alist.add(c.type__c);
        }
        
        vlist = [SELECT Id, Name, count__c FROM Vehicle__c where id in: alist];
        
        /*for(Vehicle__c v:vlist)
        {
            v.count__c=v.count__c-1;
            
        }
        
        update vlist;*/
        map <id,integer> m1 = new map<id,integer>();
        for (integer i=0;i<alist.size();i++)
        {
            id k = alist[i];
            integer count=0;
            for(integer j=0;j<alist.size();j++)
            {
                
                if(alist[j]==k)
                {
                    count=count+1;
                }
                
            }
             m1.put(k, count);
            system.debug('mapped id and count '+m1);
        }
        
        
        vlist = [SELECT Id, Name, count__c FROM Vehicle__c where id in: alist];
        //System.debug('.new'+vlist);
       for (id key :m1.keyset())  
        {
        	for(Vehicle__c v:vlist)
        	{
               // for(vehicleChild__c v1: vchlist)
                //{
                  //  if(v1.type__c==v.Id)
                   // {
                        if(v.Id==key)
                        {
                            v.count__c= v.count__c - m1.get(key);
                        }
                    //}
                    
                    
                //}
            
              vlist1.add(v);  
        	}
        }
        update vlist1;
        
        
    
    }
    
     public void updvid( list<vehicleChild__c> vchlist, list<vehicleChild__c> vchlist1)
    {
        System.debug('.new'+vchlist);
        for( vehicleChild__c c: vchlist)
        {
           alist.add(c.type__c);
                  
        }
        for( vehicleChild__c c: vchlist1)
        {
           alist1.add(c.type__c);
                  
        }
        
        vlist = [SELECT Id, Name, count__c FROM Vehicle__c where id in: alist];
        vlist1 = [SELECT Id, Name, count__c FROM Vehicle__c where id in: alist1 ];
        for(Vehicle__c v:vlist)
        {
            v.count__c=v.count__c-1;
            
        }
         for(Vehicle__c v:vlist1)
        {
            v.count__c=v.count__c+1;
            
        }
        
        update vlist;
        update vlist1;
    
    }
    
    public void undel(list <vehicleChild__c> vchlist)
    {
        for( vehicleChild__c c: vchlist)
        {
           alist.add(c.type__c);
        }
        
        vlist = [SELECT Id, Name, count__c FROM Vehicle__c where id in: alist];
        //System.debug('.new'+vlist);
        for(Vehicle__c v:vlist)
        {
            v.count__c = v.count__c + 1;
            vlist1.add(v);
        }
        
        update vlist1;
    }

    
    

}