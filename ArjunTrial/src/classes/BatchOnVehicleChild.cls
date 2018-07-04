global class BatchOnVehicleChild implements Database.Batchable<sObject> {
    global list<Vehicle__c> vlist = new list<vehicle__c>();
    global list<vehicleChild__c> vlistp = new list<vehicleChild__c>();
    global set< string> slist = new set<string>();
    global map<id, string> vehiclemap = new map<id,string>();
    global map<id, vehicleChild__c> vmap = new map<id,vehicleChild__c>();
    global BatchOnVehicleChild(Map<Id, vehicleChild__c> newMap) 
    {
        vmap=newMap;
        for (Id key : newMap.keySet()) 
        {
            slist.add(newMap.get(key).type__c) ;
            
        }
        system.debug('idlist' +slist);
        vlist=[SELECT Id, Name, Text__c FROM Vehicle__c where id in :slist];
    }
    
    global Database.QueryLocator start(Database.BatchableContext BC) 
    {
        String query = 'SELECT Id, Name, Text__c FROM Vehicle__c where id in :slist';
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<vehicle__c> accList) {
        system.debug('acclist'+acclist);
        for(vehicle__c acc : accList)
        {        
            vehiclemap.put(acc.id, acc.Text__c);
        }
        try 
        {
            for (Id key : vmap.keySet()) 
            {
                vehicleChild__c v = new vehicleChild__c();
                v.id = key;
                v.Text_From_Parent__c = vehiclemap.get(vmap.get(key).type__c);
                system.debug('text'+v.Text_From_Parent__c);
                vlistp.add(v);
                
                
            }
            system.debug('vlistp'+vlistp);
            update vlistp ;
                } 
        catch(Exception e) 
        {
            System.debug(e);
        }
        
    }   
    
    global void finish(Database.BatchableContext BC) {
        // execute any post-processing operations
    }
}