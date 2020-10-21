({
	navigateBack : function(component, helper, newComponentName, newComponentProperties) {
        helper.changeStepProgress(component, helper, "e.c:progressStepEvt", 1, 'WIZARD PAGE 1', newComponentName, newComponentProperties);
    },
    navigateNext : function(component, helper, newComponentName, newComponentProperties) {
        helper.changeStepProgress(component, helper, "e.c:progressStepEvt", 3, 'sxasxaxs', newComponentName, newComponentProperties);
    }
})