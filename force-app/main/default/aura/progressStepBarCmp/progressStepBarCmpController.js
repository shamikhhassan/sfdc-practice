({
	doInit : function(component, event, helper) {
        helper.initializeProgressStepList(component, helper);
	},
	handleStepChangeEvent : function(component, event, helper){
		helper.setProgress(component, helper);
	}
})