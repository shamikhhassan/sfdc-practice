public with sharing class AccountUpdateController {

    private Account acount;

    public AccountUpdateController()
    {
        acount=[select id,name from account where id=:ApexPages.currentPage().getParameters().get('id')];
    }
    
    public Account getAcount()
    {
        return acount;
    }
    
    public PageReference save1() {
        update acount;
        return null;
}


}