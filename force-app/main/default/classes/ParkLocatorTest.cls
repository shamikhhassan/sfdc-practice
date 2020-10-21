@isTest
private class ParkLocatorTest {
    @isTest static void testCallout() {              
        // This causes a fake response to be generated
        Test.setMock(WebServiceMock.class, new ParkServiceMock());
        List<String> myStrings = new List<String> { 'Shiretoko National Park', 'Oze National Park', 'Hakusan National Park' };
		String countryName='Japan';
        List<String> result = ParkLocator.country(countryName);
        // Verify that a fake result is returned
        System.assertEquals(myStrings, result); 
    }
}