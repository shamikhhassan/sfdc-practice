({
    //Generic method to do a server call
	callServer: function(component, method, callback, params, cacheable){
		var action = component.get(method);

        if (params) 
            action.setParams(params);
        if (cacheable) 
            action.setStorable();
        
        action.setAbortable();

        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                // pass the returned value to callback function
                callback.call(this, response.getReturnValue());
            } 
            else if (state === "ERROR") {
                var errors = response.getError();
                component.set("v.error", errors);                
				
                if (errors) 
                    throw new Error(errors);
                else
                    throw new Error("Unknown Error");
            }
        });

        $A.enqueueAction(action);
	},
    getParameterByName : function(name) {
            var url = window.location.href;
            name = name.replace(/[\[\]]/g, "\\$&");
            var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)");
            var results = regex.exec(url);
            if (!results) return null;
            if (!results[2]) return '';
            return decodeURIComponent(results[2].replace(/\+/g, " "));
    },
    navigateToURL : function(component,url) {
            var urlEvent = $A.get("e.force:navigateToURL");
            urlEvent.setParams({
                "url": url
            });
            urlEvent.fire();
    },
    validator:function(component,comp,type,criteria,compareVal){
        //debugger;
        var myvalue = component.find(comp).get("v.value");
        
         //   var myvalue = document.getElementById(comp).value;
            var difference;
            var valid = true;
            switch(type){
                case 'date':
                    if(this.dateCompare(myvalue,compareVal,criteria)){
                        alert('Pass');
                         valid = true;
                        return valid;
                    }
                        
                    else {
                        this.showToast();
                        valid = false;
                        return valid;
                    }
                    break;
                case 'regex':
                    
                    break;
            }
            
            alert('test: ' + valid + '-' + Math.floor(difference/ayear));
        },
     dateCompare:function(val,compareVal,compareType){
       //debugger;
            var isvalid = true; 
            var checkDate = Date.parse(val);
            var today = new Date();
            
            if(isNaN(compareVal) && compareVal == 'today')
            {
            isvalid = compareType == 'greater' ? checkDate > today:checkDate<today;
            return isvalid;
        }
         else if(!isNaN(compareVal))
        {
            var ayear = 1000*60*60*24*365;
            isvalid = compareType == 'greater' ? today-checkDate > compareVal : today-checkDate < compareVal ;
        }
        return isvalid
        },
    showToast : function(component, event, helper) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
            "title": "Error",
            "message": "Future date cannot be entered"
        });
        toastEvent.fire();
    },
    
    allPurposeToast : function(component, event, helper,toastProperties) {
        var toastEvent = $A.get("e.force:showToast");
        toastEvent.setParams({
           "title": toastProperties['title'],
           "type": toastProperties['type'],
           "mode" :toastProperties['mode'],
           "message": toastProperties['message']
        });
        toastEvent.fire();
    },
    toggleSpinner : function(component, toggle){
        component.set("v.showSpinner", toggle);
    }
    
    
    
    
    
    
  

})