trigger LeadEmail on Case (before insert) {
    
    if(trigger.isinsert&& trigger.isbefore)
    {
        LeadHelper l = new LeadHelper();
        l.sendmail(trigger.new);
    }

}