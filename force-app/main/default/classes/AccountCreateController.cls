//Only change i am making
public with sharing class AccountCreateController {

public Account account { get; private set; }

public AccountCreateController()
{
    Id id= ApexPages.currentPage().getParameters().get('id');
    account = (id==null) ? new Account() : [select name,site,id,phone from Account where id=:id];
}

public PageReference save()
{
    try{
        upsert account;
        }
    Catch(DmlException e)
    {
        ApexPages.addMessages(e);
        return null;
    }    
    PageReference ref=new ApexPages.StandardController(Account).view();
    return ref;
}


}