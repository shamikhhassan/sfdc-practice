public with sharing class TreeViewController{

/* Wrapper class to contain the nodes and their children */
public class cNodes
{

 public List<titanItem__c> parent {get; set;}
 Public titanOrder__c gparent {get;set;}

 public cNodes(titanOrder__c gp, List<titanItem__c> p)
 {
     parent = p;
     gparent = gp;
 }
}
/* end of Wrapper class */ 

Public List<cNodes> hierarchy;

Public List<cNodes> getmainnodes()
{
    hierarchy = new List<cNodes>();
    List<titanOrder__c > tempparent = [Select Id,Name from titanOrder__c ];
    for (Integer i =0; i< tempparent.size() ; i++)
    {
        List<titanItem__c> tempchildren = [Select Id, Name,(Select Id, Name from Tasks__r)  from titanItem__c where titanOrder__r.Id = :tempparent[i].id];
        hierarchy.add(new cNodes(tempparent[i],tempchildren));
     }   
    return hierarchy;
}   
}