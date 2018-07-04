trigger newVehicle on vehicleChild__c (after insert,after update,after delete,after undelete) {
    
    newvehicleclass helper = new newvehicleclass(); 
    
    if(trigger.isinsert)
    {
         //vehicleInsertClass helper = new vehicleInsertClass();  
         helper.getvid(trigger.new);
    }
    
    
    if(trigger.isdelete)
    {
         //vehicleInsertClass helper = new vehicleInsertClass();  
         helper.delvid(trigger.old);
    }
    
    if(trigger.isupdate)
    {
         //vehicleInsertClass helper = new vehicleInsertClass();  
         helper.updvid(trigger.old,trigger.new);
    }
    
    if (trigger.isundelete)
    {
        helper.undel(trigger.new);
    }

}