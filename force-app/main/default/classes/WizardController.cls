public with sharing class WizardController {


//Properties
Account account;
Contact contact;
Opportunity opportunity;
OpportunityContactRole role;


//Getters

    public Account getAccount() {
    if(account == null) account = new Account();
    return account;
    }
    public Contact getContact() {
    if(contact == null) contact = new Contact();
    return contact;
    }
    public Opportunity getOpportunity() {
    if(opportunity == null) opportunity = new Opportunity();
    return opportunity;
    }
    
    public OpportunityContactRole getRole() {
    if(role == null) role = new OpportunityContactRole();
    return role;
    }
    
    
//Page Navigation
    
    public PageReference step1() {
        return Page.wizardDemo1;
    }
    public PageReference step2() {
        return Page.wizardDemo2;
    }
    public PageReference step3() {
        return Page.wizardDemo3;
    }
    
    // This method cancels the wizard, and returns the user to the
    // Opportunities tab
    public PageReference cancel() {
        PageReference opportunityPage = new ApexPages.StandardController(Contact).view();
        opportunityPage.setRedirect(true);
        return opportunityPage;
    }
    
    // This method performs the final save for all four objects, and
// then navigates the user to the detail page for the new
// opportunity.
public PageReference save() {
    // Create the account. Before inserting, copy the contact's
    // phone number into the account phone number field.
    account.phone = contact.phone;
    insert account;
    // Create the contact. Before inserting, use the id field
    // that's created once the account is inserted to create
    // the relationship between the contact and the account.
    contact.accountId = account.id;
    insert contact;
    // Create the opportunity. Before inserting, create
    // another relationship with the account.
    opportunity.accountId = account.id;
    insert opportunity;
    // Create the junction contact role between the opportunity
    // and the contact.
    role.opportunityId = opportunity.id;
    role.contactId = contact.id;
    insert role;
    // Finally, send the user to the detail page for
    // the new opportunity.
    PageReference opptyPage = new ApexPages.StandardController(opportunity).view();
    opptyPage.setRedirect(true);
    return opptyPage;
    }
}