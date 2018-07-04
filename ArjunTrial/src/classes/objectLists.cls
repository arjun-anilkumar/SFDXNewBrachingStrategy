public class objectLists{
    public String val {get;set;}
    public String valf{get;set;}
    public String strInOutputText{get;set;}
     public String selectedField {get; set;}
    public integer flag=0;
    
    public objectLists()
    {
        val='contact';
    }
    
    public List<SelectOption> getName()
    {
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();   
        List<SelectOption> options = new List<SelectOption>();
        
        for(Schema.SObjectType f : gd)
        {
            if(f.getDescribe().isCustom()){
            options.add(new SelectOption(f.getDescribe().getLabel(),f.getDescribe().getLabel()));
            }
        }
        
        return options;
        
    }
    
   /* Map<String, Schema.SObjectType> gd = Schema.getGlobalDescribe();
        public list<selectoption> getFields(){
            String type='Contact';
            if(flag!=0)
            {
                system.debug('val inside if'+val);
             type=val;  
                system.debug('val inside if'+type);
            }
                            system.debug('val outside if'+type);
            List<SelectOption> options = new List<SelectOption>();
            //Creating sObject for dynamic selected object  
            Schema.SObjectType systemObjectType = gd.get(type);  
            //Fetching field results  
            Schema.DescribeSObjectResult r= systemObjectType.getDescribe();  
            system.debug('value inside r'+r);
            Map<String, Schema.SObjectField> M = r.fields.getMap();  
            system.debug('value inside m'+m);
            //Creating picklist of fields  
            for(Schema.SObjectField fieldAPI : M.values())  
            {  
                options.add(new SelectOption(fieldAPI.getDescribe().getName() , fieldAPI.getDescribe().getLabel())) ;  
            }  
            return options;
            
        }*/
    
    public List<SelectOption> getObjectFields() 
     {
            Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
            Schema.SObjectType ObjectSchema = schemaMap.get(val);
            Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
            List<SelectOption> fieldNames = new List<SelectOption>();
            for (String fieldName: fieldMap.keySet()) 
            {  
                fieldNames.add(new SelectOption(fieldName,fieldName));
              //fieldMap.get(fieldName).getDescribe().getLabel();//It provides to get the object fields label.
            }
            return fieldNames;
      }       
    
    public void callApex(){
        
        strInOutputText = val;
        flag=1;
        system.debug('string'+strInOutputText);
        // List<SelectOption> getfield( val);
    }
    
    public PageReference save(){
        return null;
    }
}