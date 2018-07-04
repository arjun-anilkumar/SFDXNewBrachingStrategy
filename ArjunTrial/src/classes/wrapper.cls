global  class wrapper {
    
    
    public id accountID{get;set;}
    public String accountName{get;set;} 
    public list<RContact> clist {get;set;}
    public class RContact {
        public id contactID{get;set;}
        public String contactfName{get;set;}
        public String contactlName{get;set;}
        public 	String contactEmail{get;set;}
        
    }
    
}