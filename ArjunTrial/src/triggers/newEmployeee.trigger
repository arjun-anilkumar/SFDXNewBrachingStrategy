trigger newEmployeee on Job_Application__c (after insert,after update) {
    
    if(Trigger.isUpdate && Trigger.isAfter){
    Employeetriggerclass helper = new Employeetriggerclass();  
    helper.EmployeeidNew(trigger.newmap,trigger.oldmap);
    
    }

}