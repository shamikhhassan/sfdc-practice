({
    
    triggerNav: function(component, event, helper) {
    //initialize the service components
    var workspaceAPI = component.find("workspace");
    var navService = component.find("navService");

    // set the pageReference object used to navigate to the component. Include any parameters in the state key.
    var pageReference = {
     "type": "standard__component",
                    "attributes": {
                        "componentName": "c__multiStepFormBaseCmp"
                    },
                    "state": {
                         "c__recordId":component.get('v.recordId') // c__<comp attribute Name>
                    }
    };

    // handles checking for console and standard navigation and then navigating to the component appropriately
    workspaceAPI
      .isConsoleNavigation()
      .then(function(isConsole) {
        if (isConsole) {
          //  // in a console app - generate a URL and then open a subtab of the currently focused parent tab
          navService.generateUrl(pageReference).then(function(cmpURL) {
            workspaceAPI
              .getEnclosingTabId()
              .then(function(tabId) {
                return workspaceAPI.openSubtab({
                  parentTabId: tabId,
                  url: cmpURL,
                  focus: true
                });
              })
              .then(function(subTabId) {
                // the subtab has been created, use the Id to set the label
                workspaceAPI.setTabLabel({
                  tabId: subTabId,
                  label: "My Label"
                });
              });
          });
        } else {
          // this is standard navigation, use the navigate method to open the component
          navService.navigate(pageReference, false);
        }
      })
      .catch(function(error) {
        console.log(error);
      });
  },
	handleInit : function(cmp, event, helper) {
        debugger;
        var navService = cmp.find("navService");
        // Sets the route to /lightning/o/Account/home
        var pageReference = {
            //type: 'standard__navItemPage',
            type: 'standard__component',
            attributes: {
                //apiName: 'MOR_Data_Capture'
                componentName: "c__multiStepFormBaseCmp"
            },
            state :{
                c__recordId:cmp.get('v.recordId')
            }
        };
        cmp.set("v.pageReference", pageReference);
        // Set the URL on the link or use the default if there's an error
        var defaultUrl = "#";
        navService.generateUrl(pageReference)
            .then($A.getCallback(function(url) {
                cmp.set("v.url", url ? url : defaultUrl);
                console.log('url');
                console.log(url);
            }), $A.getCallback(function(error) {
                cmp.set("v.url", defaultUrl);
            }));
        
    },
    
    openSubtab: function(component, event, helper) {
        var workspaceAPI = component.find("workspace");
        workspaceAPI.getEnclosingTabId().then(function(enclosingTabId) {
            workspaceAPI.openSubtab({
                parentTabId: enclosingTabId,
                pageReference: {
                    "type": "standard__component",
                    "attributes": {
                        "componentName": "c__multiStepFormBaseCmp"
                    },
                    "state": {
                         "c__recordId":component.get('v.recordId') // c__<comp attribute Name>
                    }
                }
            }).then(function(subtabId) {
                console.log("The new subtab ID is:" + subtabId);
            }).catch(function(error) {
                console.log("error");
            });
        });
    },
    openTab : function(component, event, helper) {
    var workspaceAPI = component.find("workspace");
        workspaceAPI.openTab({
            pageReference: {
                "type": "standard__component",
                "attributes": {
                    "componentName": "c__multiStepFormBaseCmp"  // c__<comp Name>
                },
                "state": {
                     "c__recordId":component.get('v.recordId') // c__<comp attribute Name>
                }
            },
            focus: true
        }).then((response) => {
               workspaceAPI.setTabLabel({
                  tabId: response,
                  label: "App Name / Tab name"
               });
        }).catch(function(error) {
            console.log(error);
        });
},
    handleClick: function(cmp, event, helper) {
        var navService = cmp.find("navService");
        // Uses the pageReference definition in the init handler
        var pageReference = cmp.get("v.pageReference");
        event.preventDefault();
        navService.navigate(pageReference);
    }
     

   

})