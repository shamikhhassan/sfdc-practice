@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub, 
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
        //calculatorServices.doAddResponse response_x = new calculatorServices.doAddResponse();
        //response_x.return_x = 3.0;
        // end
        ParkService.byCountryResponse response_x=new ParkService.byCountryResponse();
        List<String> myStrings = new List<String> { 'Shiretoko National Park', 'Oze National Park', 'Hakusan National Park' };
        response_x.return_x = myStrings;
        response.put('response_x', response_x); 
   }
}