global class batchScheduleClass implements Schedulable 
{
    map <id,vehicleChild__c> vmap = new map<id,vehicleChild__c>();
    
   global batchScheduleClass ( map<id,vehicleChild__c> vm)
    {
        vmap=vm;System.debug('hghgh');
    }
    
    global void execute(SchedulableContext sc) 
    {
        
       Database.executeBatch(new BatchOnVehicleChild(vmap));
    }
}