public class TKCaseCreation {
    
    @Future(callout=true)
    public static void createCase(String caseNo, String subject, string description, string status, string customerName, string Id) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('http://ticketsystemapi-htpm.us-e2.cloudhub.io/ticket');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        // Set the body as a JSON object
        request.setBody('{"ticket":{"id":"","ticketnumber": "'+caseNo+'","subject": "'+subject+'","description": "'+description+'","status": "'+status+'", "customername": "'+customerName+'","externalid": "'+Id+'"}}');
        HttpResponse response = http.send(request);
        // Parse the JSON response
        if(response.getStatusCode() != 201) {
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus());
        } else {
            System.debug(response.getBody());
        }
    }
}