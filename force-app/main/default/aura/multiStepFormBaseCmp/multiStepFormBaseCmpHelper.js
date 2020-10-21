({
	renderPages : function(component, helper, stepEvent, stepValue, stepDisplayText, newComponentName, newComponentProperties) {
        var formContainer = component.find("container");
          //Create the new component
        if(!$A.util.isUndefinedOrNull(newComponentName) && !$A.util.isUndefinedOrNull(newComponentProperties)){
	        $A.createComponent(
	            newComponentName, 
	            newComponentProperties,
	            function(cmp, status, errorMessage) {
	                if(status === "SUCCESS")
	                	formContainer.set("v.body", cmp);
                    	
	                else
	                    throw new Error("Failed to advance progress: " + status);    
	            }
	        ); 
        }  
	},
    
  
})