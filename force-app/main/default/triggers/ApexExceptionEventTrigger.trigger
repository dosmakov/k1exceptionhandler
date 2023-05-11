trigger ApexExceptionEventTrigger on ApexException__e (after insert) {
    new K1ExceptionHandler().handler(Trigger.new);
}