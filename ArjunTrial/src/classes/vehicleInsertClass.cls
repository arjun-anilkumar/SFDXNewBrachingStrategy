public class vehicleInsertClass {
    
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
        
        vlist = [SELECT Id, Name, count__c FROM Vehicle__c where id in: alist];
        //System.debug('.new'+vlist);
        for(Vehicle__c v:vlist)
        {
            v.count__c = v.count__c + 1;
            vlist1.add(v);
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
        
        for(Vehicle__c v:vlist)
        {
            v.count__c=v.count__c-1;
            
        }
        
        update vlist;
    
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
    
              /* if(c.type__c=='a0H7F000001xCM5')
           //{
               twowheelerlist.add(c.Id);
             //  addtwowheeler();
           }
            
            if(c.type__c=='a0H7F000001xCMA')
           {
               fourwheelerlist.add(c.Id);
            // addfourwheeler();
           }
            
        }*/
        /*system.debug('two wheeler list'+twowheelerlist);
       system.debug('two fourwheeler list'+fourwheelerlist);
        
       
       vlisttwo =[SELECT type__c, Name__c, Id, Name FROM vehicleChild__c where id in : twowheelerlist];
       vlistfour=[SELECT type__c, Name__c, Id, Name FROM vehicleChild__c where id in : fourwheelerlist];
       
        integer twocount= vlisttwo.size();
      system.debug('value two'+twocount);
       integer fourcount = vlistfour.size();
      system.debug('count four'+fourcount);
        
       vlist = [SELECT Id, Name, count__c FROM Vehicle__c];
       
        
        for(Vehicle__c v:vlist)
       {
           
         // Vehicle__c newv= new Vehicle__c();
        if(v.Name=='two wheeler')
      		{
             
             v.count__c=;
                
            }
            
            else if(v.Name=='four wheeler')
           {
               newv.Name=v.name;
              newv.count__c= fourcount;
            }
            
            vlist1.add(newv);
            
            
        }
        
        insert vlist1;
        delete vlist;*/
        
        
   
        
    //}
    // public void addtwowheeler()
      //  {
        //    for (Vehicle__c v :vlist)
          //  {
          //      Vehicle__c newv= new Vehicle__c();
            //    if(v.Name=='two wheeler')
            //{
             //   newv.Name=v.Name;
              //  newv.count__c=v.count__c+1;
                
            //}
              //  else if(v.Name=='four wheeler')
               // {
                //    newv.Name=v.Name;
               // 	newv.count__c=v.count__c;
               // }
                // vlist1.add(newv);
            //}
           // insert vlist1;
            //delete vlist;
        //}
    
     //public void addfourwheeler()
      //  {
           
       //     for (Vehicle__c v :vlist)
         //   {
          //      Vehicle__c newv= new Vehicle__c();
           //     if(v.Name=='four wheeler')
           // {
            //    newv.Name=v.Name;
             //   newv.count__c=v.count__c+1;
                
                
           // }
            //    else if(v.Name=='two wheeler')
             //   {
              //      newv.Name=v.Name;
               // 	newv.count__c=v.count__c;
                //    system.debug('count twowheeler'+v.count__c);
                //}
                // vlist1.add(newv);
                
            //}
            //insert vlist1;
          //  delete vlist;
   //     }