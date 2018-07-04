trigger CheckDate on Qalification__c (before insert , before update) {
    
    if(trigger.isinsert&& trigger.isbefore)
    {
        DateController obj = new DateController();
        obj.check(trigger.new);
    }
    
    if (trigger.isupdate && trigger.isbefore)
    {
         DateController obj = new DateController();
        obj.checkupdate(trigger.new);
    }

}