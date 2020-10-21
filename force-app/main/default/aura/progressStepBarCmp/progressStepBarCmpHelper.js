({
	initializeProgressStepList : function(component, helper){
		var progressStepCount = component.get("v.progressStepCount");
		var progressStepList = [];

		for(var index = 0; index < progressStepCount; index++)
			progressStepList.push({id : 'step' + index, name : 'Step ' + index, tooltip : 'step-' + index + '-tooltip', class : 'slds-progress__item'});

		progressStepList[0].class = 'slds-progress__item slds-is-active progress-btn';

		component.set("v.progressStepList", progressStepList);
	},
	setProgress : function(component, helper) {
		var progressStepList = component.get("v.progressStepList");
		var step = component.get("v.step");

		for(var index = 0; index < progressStepList.length; index++){
			if(index < step - 1)
				progressStepList[index].class = 'slds-progress__item progress-btn';
			else if(index === step - 1)
				progressStepList[index].class = 'slds-progress__item progress-btn slds-is-active';
			else
				progressStepList[index].class = 'slds-progress__item';
		}

        component.set("v.progressStepList", progressStepList);
	}
})