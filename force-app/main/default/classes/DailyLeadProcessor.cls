global class DailyLeadProcessor implements Schedulable {

    global void execute(SchedulableContext ctx) {
        List<Lead> oppList=new List<Lead>();
        List<Lead> opptys = [SELECT Id, Name FROM Lead WHERE LeadSource = null limit 200];
        for(Lead opp: opptys)
        {
            opp.LeadSource='Dreamforce';
            oppList.add(opp);
        }
        update oppList;

    }
    
}