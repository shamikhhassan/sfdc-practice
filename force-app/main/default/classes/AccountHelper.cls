public class AccountHelper {
    
    public static  void getList(){
        String sobjectname = 'Account' ; //object api name
		String fieldapiName = 'Type'; //Field api name
		Schema.DescribeFieldResult fieldResult = Schema.getGlobalDescribe().get(sobjectname).getDescribe().fields.getMap().get(fieldApiName).getDescribe(); 
		List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        System.debug('*** Field = ' + ple);
    }

}