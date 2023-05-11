@isTest
private class K1ExceptionTest {
    
    @isTest(SeeAllData=true) 
    static void a_user_triggered_dml_exception() {

        try {
            throw new DmlException();
        } catch (Exception e1) {
            Test.startTest();
            new K1ExceptionHandler(e1, new K1ExceptionHandlerDefault()).publish(true);
            Test.stopTest();
        }

    }
}