public with sharing class K1ExceptionHandler {
    private K1AbstractExceptionHandler handler = new K1ExceptionHandlerChatter();
    final private Boolean DO_NOT_THROW_EXCEPTION = false;

    private Exception e;

    public K1ExceptionHandler() {

    }

    public K1ExceptionHandler(Exception e) {
        this.e = e;
    }

    public K1ExceptionHandler(Exception e, K1AbstractExceptionHandler handler) {
        this.e = e;
        this.handler = handler;
    }

    public void publish() {
        publish(DO_NOT_THROW_EXCEPTION);
    }

    public void publish(Boolean doNotThrowExecution) {   
        handler.publish(e);
        if (!doNotThrowExecution) { 
            throw e;
        }
    }

    public void handler(List<ApexException__e> exceptionList) {
        handler.handler(exceptionList);
    }
}