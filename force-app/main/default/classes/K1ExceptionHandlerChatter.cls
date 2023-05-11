public with sharing class K1ExceptionHandlerChatter extends K1AbstractExceptionHandler {
    
    public override void handler(List<ApexException__e> exceptionList) {
        K1AbstractExceptionHandler.K1ExceptionMessage k1e = (K1AbstractExceptionHandler.K1ExceptionMessage)JSON.deserialize(exceptionList[0].Body__c, K1AbstractExceptionHandler.K1ExceptionMessage.class);
        publishPost(k1e.StackTraceString);
    }

    private void publishPost(String codeSnippet) {
        String communityId = Network.getNetworkId();
        String targetUserOrGroupOrRecordId  = 'me';
        // String codeSnippet = e.getStackTraceString();
        
        ConnectApi.FeedItemInput input = new ConnectApi.FeedItemInput();
        input.subjectId = targetUserOrGroupOrRecordId;
        input.feedElementType = ConnectApi.FeedElementType.FeedItem;

        ConnectApi.MessageBodyInput messageInput = new ConnectApi.MessageBodyInput();
        ConnectApi.TextSegmentInput textSegment;
        ConnectApi.MarkupBeginSegmentInput markupBeginSegment;
        ConnectApi.MarkupEndSegmentInput markupEndSegment;

        messageInput.messageSegments = new List<ConnectApi.MessageSegmentInput>();

        markupBeginSegment = new ConnectApi.MarkupBeginSegmentInput();
        markupBeginSegment.markupType = ConnectApi.MarkupType.Code;
        messageInput.messageSegments.add(markupBeginSegment);

        textSegment = new ConnectApi.TextSegmentInput();
        textSegment.text = codeSnippet;
        messageInput.messageSegments.add(textSegment);

        markupEndSegment = new ConnectApi.MarkupEndSegmentInput();
        markupEndSegment.markupType = ConnectApi.MarkupType.Code;
        messageInput.messageSegments.add(markupEndSegment);

        input.body = messageInput;

        ConnectApi.ChatterFeeds.postFeedElement(communityId, input);
    }
}