({
	changeStepProgress : function(component, helper, stepEvent, stepValue, stepDisplayText, newComponentName, newComponentProperties) {
        console.log('here');
        debugger;
        var formContainer = component.find("container");
        
        //Fire the step change event
        var progressStepEvent = component.getEvent("progressStepEvent");
        progressStepEvent.setParams({'step': stepValue, 'stepDisplayText': stepDisplayText});
        progressStepEvent.fire();

        //Create the new component
        if(!$A.util.isUndefinedOrNull(newComponentName)  && !$A.util.isUndefinedOrNull(newComponentProperties)){
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
    baseValidateForm : function(component,fieldsObjList,helper){
       
    	var isValid = true;
    	var i=0;
    	while (i < fieldsObjList.length) {
    		console.log('loop' + i);
    		var fieldObj = fieldsObjList[i];
    		console.log(fieldObj);
    		var fieldCmp = component.find(fieldObj["fieldName"]);
    		console.log(fieldCmp);
    		var errorField = fieldObj["fieldName"]+'Error';
    		console.log(errorField);
    		var fieldType = fieldObj["fieldType"];
    		console.log(fieldType);
    		var errorMsg = fieldObj["errMsg"];
    		console.log(errorMsg);
            if(fieldType !='radio'){
    		var fieldValue = fieldCmp.get("v.value");
    		console.log('value'+fieldValue);
            }
	   		var fieldvalid = helper.validateField(component,fieldCmp,fieldType,fieldValue,errorField,errorMsg,isValid);
            isValid = (isValid && fieldvalid);
    		i++;
    	}
    	console.log('exit loop' + isValid);
        return isValid;
    },

    validateField : function(component,fldCmp,fieldType,fieldValue,errorField,errorMsg,isvalid){
       
    	console.log('fieldvalidate');

    	if(fieldType == 'string')
            {
                if($A.util.isEmpty(fieldValue))
                {   
                    $A.util.addClass(fldCmp, 'slds-has-error');
                    var errCmp = component.find(errorField);
                    errCmp.set("v.errorMessage",errorMsg);
                    isvalid=false;
                    return isvalid;

                }else{
                    var errCmp = component.find(errorField);
                    errCmp.set("v.errorMessage",null);
                    $A.util.removeClass(fldCmp, 'slds-has-error');
                    return isvalid;
                }
            }
            else if(fieldType == 'number'|| fieldType == "currency")
            {
                console.log('begin number check:' );
                if($A.util.isEmpty(fieldValue) || fieldValue <=0  || Number.isNaN(fieldValue)) 
                {  
                    $A.util.addClass(fldCmp, 'slds-has-error');
                    var errCmp = component.find(errorField);
                    errCmp.set("v.errorMessage",errorMsg);
                    isvalid=false;
                    return isvalid;
                    
                }else{
                 	var errCmp = component.find(errorField);
                    errCmp.set("v.errorMessage",null);
                    $A.util.removeClass(fldCmp, 'slds-has-error');
                    return isvalid;
                   
                }             
                console.log('end number check:' + fieldName);
            }
				//Block to validate radio elements
                else if(fieldType == 'radio'){
                     console.log('fieldType == radio');
                     var valueArray=[];
                     for(var i=0;i<fldCmp.length;i++){
        					valueArray.push(fldCmp[i].get("v.value"));
        				}
                    var check=false;
                    for(var i=0;i<valueArray.length;i++){
                        if(valueArray[i]){check=true;}
                    }
                    //Checking if any radio button is clicked
                   if(check){
                 	var errCmp = component.find(errorField);
                    errCmp.set("v.errorMessage",null);
                    $A.util.removeClass(fldCmp, 'slds-has-error');
                    return isvalid;
        			}
                    else{
            			$A.util.addClass(fldCmp, 'slds-has-error');
                        var errCmp = component.find(errorField);
                        errCmp.set("v.errorMessage",errorMsg);
                        isvalid=false;
                        return isvalid;
                     
                	} 
                    
                }
        //shamikh
            console.log('end validator');
            
        },
        createFieldsObj : function(fieldname, fieldtype, errorMsg){
        
        	var fldObject;
            fldObject = { "fieldName" : fieldname,
                              "fieldType" : fieldtype,
                              "errMsg" : errorMsg };
            return fldObject;
        }
})