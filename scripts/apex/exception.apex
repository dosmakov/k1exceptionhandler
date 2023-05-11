try {
    throw new DmlException();
} catch (Exception e) {
    new K1ExceptionHandler(e).publish();
}