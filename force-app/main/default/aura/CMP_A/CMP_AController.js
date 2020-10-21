({
    
    doInit : function(component, event, helper) {
        
        //helper.getURLParams(component, event,helper);
		
	},
  
  radioChange : function(component, event, helper) {
        //var drawdownName=component.find('drawdownAmount').get('v.name');
      // var drawdownValue=component.find('drawdownAmount').get('v.value');
      // var drawdownReadonly=  component.find('drawdownAmount').get('v.readonly');
        debugger;
 		var buttonName = event.getSource().get("v.name");
        var buttonValue = event.getParam("value");
      
      if(buttonName=='radioGroup1' && buttonValue=='yes'){      
          component.find('aaa').addClass("slds-show");
          
      }
      else{       
          component.find('drawdownAmount').set('v.disabled',false);
      }
      
      
		
	},
    
    
	next : function(component, event, helper) {
        debugger;
        var drawdownValue=component.find('drawdownAmount').get('v.value');
        var radio=component.find('radio1').get('v.value');
        var SampleData={drawdownValue:drawdownValue,radio:radio,Att3:"Att3",Att4:"Att4",Att5:"Att5",Att6:"Att6",Att7:"Att7"};
        
        helper.navigateNext(component, helper, "c:CMP_B",{dataObject:SampleData});
		
	},
    
    handleSectionToggle: function (cmp, event) {
        var openSections = event.getParam('openSections');

        if (openSections.length === 0) {
            cmp.set('v.activeSectionsMessage', "All sections are closed");
        } else {
            cmp.set('v.activeSectionsMessage', "Open sections: " + openSections.join(', '));
        }
    }
    
})