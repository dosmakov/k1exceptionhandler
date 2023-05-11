public abstract class K1AbstractExceptionHandler {
    public virtual void publish(Exception e) {
        
        K1ExceptionMessage k1e = new K1ExceptionMessage(e);

        EventBus.publish(
            new ApexException__e(
                Body__c = JSON.serialize(k1e)
            )
        );
    }

    public abstract void handler(List<ApexException__e> exceptionList);

    public class K1ExceptionMessage {
        public Integer LineNumber;
        public String Message;
        public String StackTraceString;
        public String TypeName;

        public K1ExceptionMessage(Exception e) {
            LineNumber = e.getLineNumber();
            Message = e.getMessage();
            StackTraceString = e.getStackTraceString();
            TypeName = e.getTypeName();
        }

    }

}