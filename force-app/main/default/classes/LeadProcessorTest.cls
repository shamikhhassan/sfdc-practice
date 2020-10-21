@isTest
private class LeadProcessorTest {

    @testSetup 
    static void setup() {
        List<Lead> leads = new List<Lead>();
        // insert 200 Leads with Dreamforce 
        for (Integer i=0;i<200;i++) {
            leads.add(new Lead(FirstName='Lead '+i,LastName='New', Company='TechMahindra',LeadSource='Dreamforce'));
        }
        insert leads;
        
    }

    static testmethod void test() {        
        Test.startTest();
        LeadProcessor processor=new LeadProcessor();
        Id batchId = Database.executeBatch(processor);
        Test.stopTest();

        // after the testing stops, assert records were updated properly
        System.assertEquals(200, [select count() from lead where LeadSource = 'Dreamforce2']);
    }
    
}