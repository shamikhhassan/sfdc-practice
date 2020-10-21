@isTest
private class DailyLeadProcessorTest {
    
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';

    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // insert 200 Leads with shamikh 
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(FirstName='Daily Lead '+i,LastName='New', Company='TechMahindra'));
        }
        insert leads;
        
    }

    static testmethod void test() {        
        Test.startTest();
        // Schedule the test job
        String jobId = System.schedule('ScheduledApexTest',CRON_EXP, new DailyLeadProcessor());        
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from lead where LeadSource = 'Dreamforce']);
    }
    
}