public class ContactClass {
    
   public list<Contact> clist {get;set;}
    public integer a=1;
    public list<contact> newupdate = new list<contact>();
    
   public ContactClass(){
       clist = [SELECT  FirstName, LastName, Phone FROM Contact limit 10];    
   }   
    public void updatelist()
    {
        upsert clist;
     
    }
    
   // public  confirmCancel()
	//{
	//	public var r = confirm("Are you sure you want to cancel this issue"?);
	//	if (r==true)
  	//	{
     // 		upsert clist;
  	//	}

		//else
  		//{
      	//  rend = true;

  		//}
	//}
}