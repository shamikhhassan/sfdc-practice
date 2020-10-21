({		
    doInit : function(component, event, helper){
    	
    component.set("v.activeProgressStepDisplayText", 'Wizard Page 1');
    
},
		
    handleProgressStepEvent : function(component, event, helper){
		var activeProgressStep = event.getParam('step');
		var activeProgressStepDisplayText = event.getParam('stepDisplayText');

		component.set("v.activeProgressStep", activeProgressStep);
		component.set("v.activeProgressStepDisplayText", activeProgressStepDisplayText);
        
	}
})