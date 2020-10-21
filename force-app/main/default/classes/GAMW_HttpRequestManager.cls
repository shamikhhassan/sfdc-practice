public class GAMW_HttpRequestManager {
    
    /*
 * Makes HTTP Request to external systems
 * @author: Varun Kaushish
 * @date: Feb 2019
 * @omcl - Adding Logic to Make Requests Without Named Credentials
 */
    /*
    // handles http callout using named credentials and without
    public static HttpResponse makeHttpRequest(String namedCredentials, String serviceURL, String httpMethod, String requestBody){
        
        PRU_ApigeeSettings__c apigeeSettings = PRU_ApigeeSettings__c.getInstance();
		boolean useNamedCredentials = apigeeSettings.PRU_UseNamedCredentials__c;
        String resourceUrl = apigeeSettings.PRU_BaseUrl__c;
        String username = apigeeSettings.PRU_ConsumerKey__c;
		String password = apigeeSettings.PRU_ConsumerSecret__c;
        String certificateName = apigeeSettings.PRU_CertificateName__c;
        
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        if (useNamedCredentials == false){
			Blob headerValue = Blob.valueOf(username + ':' + password);
			String authorizationHeader = 'Basic ' + EncodingUtil.base64Encode(headerValue);
            req.setHeader('Authorization', authorizationHeader);
			req.setEndpoint(resourceUrl+serviceURL);
            req.setClientCertificateName(certificateName);
        }else {
			req.setEndpoint('callout:'+namedCredentials+'/'+serviceURL);
        }
        if(requestBody != null){
            req.setBody(requestBody);
        }
        // Used for internal api routing
        req.setHeader('pruwealth-api-origin', URL.getSalesforceBaseUrl().toExternalForm());
        // External Apigee routing header
        req.setHeader('Origin', URL.getSalesforceBaseUrl().toExternalForm());
        req.setHeader('Content-Type', 'application/json; charset=UTF-8');
        req.setMethod(httpMethod);
        req.setTimeout(120000);
        HttpResponse res = h.send(req);
        return res;
    }
        
*/

}