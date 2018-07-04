public class paginationNewPartcontroller {
 @AuraEnabled
    public static String getContacts(String objectName,String fieldName){
        List<sObject> mylist = new List<sObject>();        
        String query = 'Select ';
        string fieldNames = queryableField(objectName, fieldName);                
        if(string.isNotBlank(objectName) && string.isNotBlank(fieldNames)){            
            if(!new set<string>(new List<String>(fieldNames.split(','))).contains('Id'))
                query +='Id, ';                    
                query += fieldNames +' from '+objectName;
        }else if(string.isNotBlank(fieldNames)){
            if(!new set<string>(new List<String>(fieldNames.split(','))).contains('Id'))
                query +='Id, ';                
                query += fieldNames +' from contact';
        } 
        if(query != null)
            mylist = Database.query(query);        
        if(mylist !=  null && mylist.size() > 0){
            Map<String, Schema.SObjectField> FieldMap = Schema.getGlobalDescribe().get(string.valueOf(mylist.get(0).getSObjectType())).getDescribe().fields.getMap();
            String jSon='[';                    
            String coma='';
            List<string> field = fieldNames.split(',');                        
            for(sObject con : mylist)
            {
                jSon += '[';
                Integer i=0;
                for(string f : field){
                    if(i==0){                    
                        jSon += coma + '"<a target=\'_blank\' class=\'showDetail\' id=\''+con.get('Id')+'\' >' +con.get(f)+ '</a>",';
                    } else {
                        jSon += coma + '"'+con.get(f)+'",';
                    }
                    i++;
                }   
                jSon += '],';                
            } 
            jSon+=']';
            return jSon;
         } else {
             return null;
         }         
    }
//function for return valid fields on basis of object and fields string.
    @AuraEnabled
        public static string queryableField(string objectString, string fieldString){
        if((string.isBlank(objectString) && string.isBlank(fieldString))
        || (string.isNotBlank(objectString) && string.isBlank(fieldString))    
        || string.isBlank(fieldString)   
        )
        return null;       
        
        set<string> objectName = new set<string>();
        for(string obj : Schema.getGlobalDescribe().keyset()) 
            objectName.add(obj.toLowercase()); 
        
        if(!objectName.contains(objectString.toLowercase()))
            return null;
                           
        set<string> allFields = new set<string>();
        set<string> validField = new set<string>();
        Map<String, Schema.SObjectField> FieldMap;
        if(string.isNotBlank(objectString))
            FieldMap = Schema.getGlobalDescribe().get(objectString).getDescribe().fields.getMap();
        else
            FieldMap = Schema.getGlobalDescribe().get('contact').getDescribe().fields.getMap();
             
         
        for(string field : FieldMap.keySet()){                
            allFields.add(FieldMap.get(field).getDescribe().getName().toLowercase());                   
        }          
        for(string f : fieldString.split(',')){           
            if(string.isNotBlank(f)){
                if(allFields.contains(f.toLowercase()))
                    validField.add(f.capitalize());
            }        
        }         
        return string.join(new List<string>(validField),',');
    }
}