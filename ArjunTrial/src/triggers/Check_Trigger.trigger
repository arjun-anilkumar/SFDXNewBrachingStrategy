trigger Check_Trigger on Account (after insert) {
    public list<contact> newcontact =new list<Contact>();
    
    for(Account acc : trigger.new)
    {
        contact con =new contact();
       con.LastName = acc.name;
   //     con.Email = acc.email;
       newcontact.add(con);
    }
    insert newcontact;
    
    
    

}