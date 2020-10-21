/******************************************************************************************************
@Name : PRU_AssetValuation 
@Description : Class to send request to fetch the Asset valuation from Sonata and send the response to the hanlder Class
@Author : Odhran McLaughlin
@Versions : 08/04/2019 Created                       
@see: ST-29956
@updates - VK - updates the http manager class
@update - VK - Adds the asset valuation service URL in custom settings
******************************************************************************************************/
public class PRU_AssetValuation {
    /*@AuraEnabled
    public static List<PRU_AssetValuationResponseHandler> getValuation(Id assetId){
        //Return list with response from call
        List<PRU_AssetValuationResponseHandler> lstResponse = new List<PRU_AssetValuationResponseHandler>();
        //List to get asset name from record id
        String aId = assetId == null ? null : String.escapeSingleQuotes(assetId);
        List<Asset> lstAsset = [SELECT Id, Name, RecordType.Name, Parentid FROM Asset WHERE Id =: aId];
        PRU_ApigeeSettings__c apigeeSettings = PRU_ApigeeSettings__c.getInstance();
        String resourceUrlTemplate 	= apigeeSettings.PRU_AssetValuationResource__c ;
   
        String RETNumber;
        String AssetRecordName = lstAsset[0].RecordType.Name; 
        String AssetParentID = lstAsset[0].Parentid == null ? null : String.escapeSingleQuotes(lstAsset[0].Parentid);
       
        //checking to see if the record is not retirement account or if its a child record 
        if (AssetRecordName != 'Retirement Account' && AssetParentID != NULL){ 
           //getting parent record name from parent record id 
            List<Asset> ParentlstAsset = [SELECT Id, Name, RecordType.Name, Parentid FROM Asset WHERE Id = :AssetParentID];
          //Assigning Parent name as RETNumber to use in call     
            RETNumber = ParentlstAsset[0].Name;
        }else{
            //using orgien asset name to RETNumber to use in call
            RETNumber = lstAsset[0].Name;
        }    
        //declaring URL to use in Call with RETNumber gotten above with the structure needed to make the call 
        try{
            List<Object> parameters = new List<Object> {RETNumber};
            String serviceURL = String.format(resourceUrlTemplate, parameters);
            HttpResponse resp = PRU_HttpRequestManager.makeHttpRequest(PRU_Constants.APIGEE_SBS_NAMED_CREDENTIALS,serviceURL,PRU_Constants.HTTP_METHOD_GET,null);
            //setting body with response from call
            String body = resp.getBody();
            
            //Applying '[]' to response body to help with Json.Deserialize as responnse returning a JSON object when SF expecting an Array 
            String BracketResp = '['+resp.getBody()+']';
            system.debug('#body '+resp.getBody());
            //Deserializing the Response and passing it into the handler class
            lstResponse = (List<PRU_AssetValuationResponseHandler>) JSON.deserialize(BracketResp, List<PRU_AssetValuationResponseHandler>.class);
            system.debug('#JSONResponse '+BracketResp);
            system.debug('#lstResponse '+lstResponse);
            return lstResponse;
        }
        catch(Exception e){
            System.Debug('An error occurred. Exception: ' + e.getLineNumber() + ':' + e.getMessage() + ':' + e.getStackTraceString());
            return null;
        }
    }
    @AuraEnabled
    public static String getAssetId(String retNumber){
        Asset assetObj=[select id from Asset where name =: retNumber limit 1];
        System.debug('#it is coming to getAsset Method'+ assetObj.id);
        return assetObj.id;
    }

    @AuraEnabled
    public static String getAssetName(String RecordId){
        Asset assetObj=[select name from Asset where id =: RecordId limit 1];
        System.debug('#it is coming to getAsset Method'+ assetObj.name);
        return assetObj.name;
    */
}