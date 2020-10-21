trigger AccountTrigger on Account (before insert, 
                                   after insert, 
                                   before update, 
                                   after update, 
                                   before delete, 
                                   after undelete, 
                                   after delete) {
    
    TriggerDispatcher.run( new AccountTriggerHandler() , Trigger.OperationType );
    
}