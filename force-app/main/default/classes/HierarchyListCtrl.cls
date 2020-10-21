public class HierarchyListCtrl {
    
    @AuraEnabled
    public static String getTopLevel(String currAcctId){
        Boolean isTopLevelAccount=false;
        while (!isTopLevelAccount) {
            Account acct = [select a.Id, a.ParentId From Account a where a.Id = :currAcctId limit 1];
            if (acct.ParentID != null) {
                currAcctId = acct.ParentID;
            } else {
                isTopLevelAccount = true;
            }
        }
        return currAcctId;
        
    }
    
}