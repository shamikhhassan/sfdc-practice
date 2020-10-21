public class StringArrayTest {
    
    public static List<String> generateStringArray(Integer count)
    {
       List<String> moreColors = new List<String>();
        for(Integer i=0;i<count;i++)
        {
           moreColors.add('Test '+i);
        }
        System.debug('The size is '+moreColors.size());
        return moreColors;
    }

}