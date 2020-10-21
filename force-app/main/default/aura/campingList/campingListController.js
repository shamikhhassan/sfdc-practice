({

	// Load expenses from Salesforce
	doInit: function(component, event, helper) {
	
	    // Create the action
	    var action = component.get("c.getItems");
	
	    // Add callback behavior for when response is received
	    action.setCallback(this, function(response) {
	        var state = response.getState();
	        if (component.isValid() && state === "SUCCESS") {
	            component.set("v.items", response.getReturnValue());
	        }
	        else {
	            console.log("Failed with state: " + state);
	        }
	    });
	
	    // Send action off to be executed
	    $A.enqueueAction(action);
	},
	
	
handleAddItem: function(component, event, helper) {
        var item = event.getParam("item");
        console.log("Inside handleAddItem  ")  ;
        console.log(item)  ;      
        var action = component.get("c.saveItem");
        action.setParams({
            "item": item
        });
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if (component.isValid() && state === "SUCCESS") {        
                var items = component.get("v.items");
                items.push(item);
                component.set("v.items",items);
            }
        });
        $A.enqueueAction(action);
    }
	



	

/*###################################################without DB####################################################################################*/
	/*
submitForm: function(component, event, helper) {
    if(helper.validateItemForm(component)){
        // Create the new expense
        var newItem = component.get("v.newItem");
        helper.createItem(component, newItem);
    }
}






clickCreateItem : function(component, event, helper) {
		
        var validItem = true;
        
        //  get and verify the name is set
        var nameField = component.find("campItemName");
        var campname = nameField.get("v.value");
        if ($A.util.isEmpty(campname))
        {
            validItem = false;
            nameField.set("v.errors", [{message: "Camping Item name can't be blank."}]);
        }
        else
        {
            nameField.set("v.errors", null);
        }
        
        //  check quantity
        var quantityField = component.find("quantity");
        var quantityValue = quantityField.get("v.value");
        if ($A.util.isEmpty(quantityValue) || quantityValue == 0)
        {
            validItem = false;
            quantityField.set("v.errors", [{message : "Quantity cannot be 0 or blank."}]);
        }
        else
        {
            quantityField.set("v.errors", null);
        }
        
        //  check price
        var priceField = component.find("price");
        var priceValue = priceField.get("v.value");
        if ($A.util.isEmpty(priceValue) || priceValue == 0)
        {
            validItem = false;
            priceField.set("v.errors", [{message : "Price cannot be 0 or blank."}]);
        }
        else
        {
            priceField.set("v.errors", null);
        }
        
        if (validItem)
        {
            //  gets refernce to view's newItem attribute
            var newItemRef = component.get("v.newItem");
            console.log("Create Camping Item: " + JSON.stringify(newItemRef));
            
            //helper.createItem(component, newItem);
            
            // **** begin helper class code ****
            // note that i originally created helper class to perform the logic below
            // but it appears as though the challenge is expecting you NOT to use helper class
            // which would be why i was getting challenge error while using it
            var theItems = component.get("v.items");
 
            // Copy the expense to a new object
            // THIS IS A DISGUSTING, TEMPORARY HACK
            var newItem = JSON.parse(JSON.stringify(newItemRef));    
            theItems.push(newItem);
            component.set("v.items", theItems);
            //  *******  end helper class code *********
            
            //  this will reset the view's newItem object 
            //  to a be a blank sobject of type Camping_Item__c
            //  credit to: Shobhit Saxena
            component.set("v.newItem", 
                          {'sobjectType' : 'Camping_Item__c',
                           'Name' : '',
                           'Quantity__c' : 0,
                           'Price__c' : 0,
                           'Packed__c' : false});
                           
        }
        
	}*/
	
	

})