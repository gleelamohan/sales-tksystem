@RestResource(urlMapping='/Case/*')
global without sharing  class CaseManager {
    
    @HttpPost
    global static String doPost(String Id, String Status) {
        
        case c = [select Id, Status from case where Id =:Id];
        c.Status = Status;
        update c;
        return 'Update Success'+Id+Status;
        }
    

}