public with sharing class K1ExceptionHandlerDefault extends K1AbstractExceptionHandler {
    public override void handler(List<ApexException__e> exceptionList) {
        System.debug(LoggingLevel.INFO, 'Default Exception Handler');
        System.debug(LoggingLevel.ERROR, exceptionList);
    }
}