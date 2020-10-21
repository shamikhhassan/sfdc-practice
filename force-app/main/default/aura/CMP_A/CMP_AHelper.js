({
	navigateNext : function(component, helper, newComponentName, newComponentProperties) {
         var SampleData=component.get('v.dataObject');
        helper.changeStepProgress(component, helper, "e.c:progressStepEvt", 2, 'Page 2', newComponentName, SampleData);
        

     },
    
    getURLParams : function(component,event,helper) {
        var abc=helper.getParameterByName('c__recordId');
        component.set('v.recordId',abc);
        

     },
})