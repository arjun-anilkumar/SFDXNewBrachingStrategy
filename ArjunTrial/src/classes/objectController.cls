// picklist to get all objects and to get other picklist filled with corresponding fields( apex describe)
public class objectController
{
    public Map <String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
    
    public String selectedObject {get; set;}
    
    public String selectedField {get; set;} 
    
    Public objectController()
    {
        selectedObject = 'account';  
    }
    
    /*public List<SelectOption> getObjectNames()// function to get all objects
    {
        system.debug('schemamap'+schemaMap);
        List<SelectOption> objNames = new List<SelectOption>();
        List<String> entities = new List<String>(schemaMap.keySet());
        system.debug('value in entities'+entities);
        entities.sort();
        for(String name : entities)
        {
            system.debug('inside for loop name '+name);
            
            objNames.add(new SelectOption(name,name));
           
            system.debug('value added '+objNames);
        }
        system.debug('objname  &&&& '+objNames);                 
        return objNames;
    }*/
    public List<SelectOption> getName()// function to get only custom objects
    {
        List<Schema.SObjectType> gd = Schema.getGlobalDescribe().Values();   
        List<SelectOption> options = new List<SelectOption>();
        
        for(Schema.SObjectType f : gd)
        {
            if(f.getDescribe().isCustom()){
           options.add(new SelectOption(f.getDescribe().getName(),f.getDescribe().getLabel()));
           
            }
        }
        
        return options;
        
    }
    
    public List<SelectOption> getObjectFields()
    {
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();
        system.debug('selected '+selectedObject);
        //string s=selectedObject+'__c';
         // system.debug('selected obj'+s);
        Schema.SObjectType ObjectSchema = schemaMap.get(selectedObject);
        Map<String, Schema.SObjectField> fieldMap = ObjectSchema.getDescribe().fields.getMap();
        system.debug('inside getObjField ****'+fieldMap);
        List<SelectOption> fieldNames = new List<SelectOption>();
        system.debug('inside getObjField ****'+fieldNames);
        for (String fieldName: fieldMap.keySet())
        {
            fieldNames.add(new SelectOption(fieldName,fieldName));
            //fieldMap.get(fieldName).getDescribe().getLabel();//It provides to get the object fields label.
        }
        return fieldNames;
    }
}