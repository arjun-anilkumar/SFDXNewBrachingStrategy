public class accountlistclass {
    public list <Account> alist {get;set;}
     public accountlistclass()
    {
        alist=[SELECT Id, Name FROM Account];
    }

}