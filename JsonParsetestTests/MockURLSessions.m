//
//  MockURLSessions.m
//  JsonParsetestTests
//
//  Created by Paradox Space Rumy M1 on 17/4/22.
//

#import "MockURLSessions.h"

@interface DummyURLSessionDataTask: NSURLSessionDataTask{
    
}
@end

@implementation DummyURLSessionDataTask
- (void)resume{
    
}
@end



@implementation MockURLSessions

- (id _Nonnull )init{
    self = [super init];
    if (self) {
        self.dataTaskCallCount=0;
        self.dataTaskArgsURL = NSMutableArray.new;
        self.completionBlocks = NSMutableArray.new;
    }
    return self;
}

- (nonnull NSURLSessionDataTask *)dataTaskWithURL:(nonnull NSURL *)url completionHandler:(nonnull void (^)(NSData * _Nullable, NSURLResponse * _Nullable, NSError * _Nullable))completionHandler {
    _dataTaskCallCount += 1;
    [_dataTaskArgsURL addObject:url];
    [self.completionBlocks addObject:completionHandler];
    return [[DummyURLSessionDataTask alloc] init];
}

@end


