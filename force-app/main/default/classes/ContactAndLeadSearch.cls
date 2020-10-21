public class ContactAndLeadSearch {

    public static List<List<SObject>> searchContactsAndLeads(String param1)
    {
       String name=param1;
       List<List<sObject>> searchList = [FIND :name IN ALL FIELDS RETURNING Lead(Name),Contact(FirstName,LastName,Department)];
       return searchList;
    }
}