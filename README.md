# About

Here you can find an example on how to create Chatter post from Apex exception. The Chatter post will be created asynchronously by using Platform Event, so the exception handler can throw the Apex error back and make publishing of the chatter post transparent for the user.

Unfrotunatly, ConnectApi cannot be used by Automated Process user. So, it is required to specify user that will be used to publish the Chatter post. It is possible by using PlatformEventSubscriberConfigs. For more details see Salesforce Metadata API documentation.

`K1AbstractExceptionHandler` is an abstract class that can be used to create another error handlers, e.g. to store the error in the custom object or by sending to external monitoring system as AWS CloudWatch.

Handler class should be set in `K1ExceptionHandler` class to `handler` variable. The value for the variable can be taken from custom setting moving forward.

See `script/apex/exception.apex` to understand how to use the framework.