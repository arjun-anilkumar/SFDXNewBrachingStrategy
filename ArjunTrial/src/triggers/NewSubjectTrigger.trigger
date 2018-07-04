trigger NewSubjectTrigger on EmailMessage (after insert) {  
    SubjectTriggerHelper obj = new SubjectTriggerHelper();
    obj.SubjectFill(trigger.new);
    
}