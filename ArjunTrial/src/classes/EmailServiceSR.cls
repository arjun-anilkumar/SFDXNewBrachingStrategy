global class EmailServiceSR implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailresult();   
        String myPlainText= '';
        myPlainText = email.plainTextBody;  
        EmailMessage SRemail = new EmailMessage();
        list<EmailMessage>emaillist = new list<EmailMessage>();  
        try {   
            string sub = email.subject;
            system.debug('subject'+email.subject);
            string subj=sub.substring(0, 2);
            if(subj=='M-')
            {
                SRemail.Subject = email.subject;
                SRemail.FromName= email.fromAddress;
                emaillist.add(SRemail);
            }
            insert emaillist;       
        }   
        catch (QueryException e) {
            System.debug('Query Issue: ' + e);
        }   
        result.success = true;   
        return result;
    }
}