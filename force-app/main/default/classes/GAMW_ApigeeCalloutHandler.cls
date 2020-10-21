public class GAMW_ApigeeCalloutHandler {
    
    /*---------------------------------------------------------------------
 * APIGEE Call Out Handler to support multiple requests sent via ApiGee
 * @author: Lucian
 * @date: Nov 2018
 * @Updated: Sanjeel - Added Contribution Activation - ST-27471
 * @Updated: Sanjeel - Added TaxCodeActivation &  SingleContributionService
 * @Updated: Varun K - Adds common http request manager class to use named credential
 --------------------------------------------------------------------*/

/*
    public enum Resource { AccountActivation, PaymentActivation, SMS, ContributionActivation, TaxCodeActivation, SingleContributionService, SingleTaxIncomeResource }
    public HTTPResponse callApigeeEndpoint(Resource resource, String httpMethod, String requestBody) {
        
        String serviceURL = getServiceUrl(resource);
        HttpResponse res = PRU_HttpRequestManager.makeHttpRequest(PRU_Constants.APIGEE_SBS_NAMED_CREDENTIALS,serviceURL,httpMethod,requestBody);
        String responseBody = res.getBody();
        ApigeeOauthResponse oauthResponse = (ApigeeOauthResponse)JSON.deserialize(responseBody, ApigeeOauthResponse.Class);
        if(oauthResponse.fault != null) {
            throw new PRU_ApigeeOauthException(getOauthErrorMessage(oauthResponse));
        }
        ApigeeErrorResponse errorResponse = (ApigeeErrorResponse)JSON.deserialize(responseBody, ApigeeErrorResponse.Class);
        if(errorResponse.errorCode != null || errorResponse.errorType != null || errorResponse.errorMessage != null) {
            throw new PRU_ApigeeErrorException(getErrorMessage(errorResponse));
        }
        return res;
    }
    
    // get the service url from custom settings 
    private String getServiceUrl( Resource resource) {
        PRU_ApigeeSettings__c apigeeSettings = PRU_ApigeeSettings__c.getInstance();
        if(resource == PRU_ApigeeCalloutHandler.Resource.AccountActivation) {
            return apigeeSettings.PRU_AccountActivationResource__c;
        }
        if(resource == PRU_ApigeeCalloutHandler.Resource.PaymentActivation) {
            return apigeeSettings.PRU_PaymentActivationResource__c;
        }
        if(resource == PRU_ApigeeCalloutHandler.Resource.ContributionActivation) {
            return apigeeSettings.PRU_ContributionActivationResource__c;
        }
        if(resource == PRU_ApigeeCalloutHandler.Resource.SMS) {
            return apigeeSettings.PRU_SmsResource__c;
        }
        if(resource == PRU_ApigeeCalloutHandler.Resource.TaxCodeActivation) {
            return apigeeSettings.PRU_TaxCodeActivationResource__c;
        }
        if(resource == PRU_ApigeeCalloutHandler.Resource.SingleTaxIncomeResource) {
            return apigeeSettings.PRU_SingleTaxIncomeResource__c;
        }
        if(resource == PRU_ApigeeCalloutHandler.Resource.SingleContributionService) {
            return apigeeSettings.PRU_SingleContributionServiceActivation__c;
        }
        return '';
    }
    
    public String getErrorMessage(ApigeeErrorResponse errorResponse) {
        String message = '';
        if(errorResponse.errorCode != null) {
            message += 'errorCode: ' + errorResponse.errorCode + ';';
        }
        if(errorResponse.errorType != null) {
            message += 'errorType: ' + errorResponse.errorType + ';';
        }
        if(errorResponse.errorMessage != null) {
            message += 'errorMessage: ' + errorResponse.errorMessage + ';';
        }
        return message;
    }
    
    public String getOauthErrorMessage(ApigeeOauthResponse oauthResponse) {
        String message;
        if(oauthResponse.fault != null) {
            message = oauthResponse.fault.faultString + '; Detail: ';
            if(oauthResponse.fault.detail != null) {
                message += oauthResponse.fault.detail.errorcode;
            }
        }
        return message;
    }
    
    public class ApigeeErrorResponse {
        public String errorCode { get; set; }
        public String errorType { get; set; }
        public String errorMessage { get; set; }
    }
    
    public class ApigeeOauthResponse {
        public ApigeeOauthFault fault { get; set; }
    }
    
    public class ApigeeOauthFault {
        public string faultstring { get; set; }
        public ApigeeOauthFaulDetail detail { get; set; }
    }
    
    public class ApigeeOauthFaulDetail {
        public string errorcode { get; set; }
    }
    
    public class PRU_ApigeeErrorException extends Exception {

    }
    
    public class PRU_ApigeeOauthException extends Exception {
    	
    }
*/

}