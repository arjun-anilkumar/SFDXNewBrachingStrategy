trigger VehicleParentText on vehicleChild__c (after insert){
    
    Datetime executeTime = (System.now()).addSeconds(1);
    
    String cronExpression = GetCRONExpression(executeTime);
    //list<CronTrigger> c = GetScheduledJobs();
    //system.debug('list size'+c.size());
    boolean check =MaxScheduledJobsReached();
    system.debug('check####' + check);
    if(check)
    {
       // batchScheduleClass scheduledJob = new batchScheduleClass(trigger.newmap);
        System.schedule('ScheduledJob ' + executeTime.getTime(),cronExpression,new batchScheduleClass(trigger.newmap));	       
        
    }
    
    
    
    public static String GetCRONExpression(Datetime dt) {
        
        return ('' + dt.second() + ' ' + dt.minute() + ' ' + dt.hour() + ' ' + dt.day() + ' ' + dt.month() + ' ? ' + dt.year());
    }
    
    
    
    // Determine whether the maximum number
    // of Scheduled Jobs has been reached
    public static Boolean MaxScheduledJobsReached() {
         Integer MAX_SCHEDULED_JOBS	= 10;
        //return (GetScheduledJobs().size() <= MAX_SCHEDULED_JOBS) ;
        system.debug('MAX_SCHEDULED_JOBS@@@' + MAX_SCHEDULED_JOBS);
        if(GetScheduledJobs().size() <= MAX_SCHEDULED_JOBS){
            system.debug('MAX_SCHEDULED_JOBS@@@' + MAX_SCHEDULED_JOBS);
            return true;
        }
        return false;
    }
    
    // Returns all Scheduled Apex jobs that have not been started yet 
    public static List<CronTrigger> GetScheduledJobs() {
        return [select Id, NextFireTime 
                from CronTrigger 
                where State in ('WAITING','ACQUIRED','EXECUTING')
                or NextFireTime != NULL];
    }                                              
    
    
}