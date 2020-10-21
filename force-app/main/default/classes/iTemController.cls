public with sharing class iTemController {

//Property
titanItem__c item;
titanProduct__c product;

//Getters

public titanItem__c  getItem(){
    if(item==null)
        item=new titanItem__c();
        return item;
    
}

public titanProduct__c  getProduct(){
    if(product==null)
        product=new titanProduct__c();
        return product;
    
}

//Navigation
public PageReference step1(){
    return Page.WizardItemProduct1;
}

//Navigation
public PageReference step2(){
    return Page.WizardItemProduct2;
}

public PageReference cancel() {
    PageReference opportunityPage = new ApexPages.StandardController(product).view();
    opportunityPage.setRedirect(true);
    return opportunityPage;
}

public PageReference save(){

insert product;

item.Product__c=product.id;
insert item;

PageReference opptyPage = new ApexPages.StandardController(product).view();
opptyPage.setRedirect(true);
return opptyPage;
}


}