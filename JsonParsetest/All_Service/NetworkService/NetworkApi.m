//
//  NetworkApi.m
//  JsonParsetest
//
//  Created by Paradox Space Rumy M1 on 13/4/22.
//

#import "NetworkApi.h"

@implementation NetworkApi

+ (id)sharedNetworkApi:(id<URLSessionProtocol>)session {
    static NetworkApi *shared = nil;
    @synchronized(self) {
        if (shared == nil)
            shared = [[self alloc] initWith:session];
    }
    return shared;
}

- (id)initWith:(id<URLSessionProtocol>)session{
    self = [super init];
    self.sharedSession = session;
    return self;
}

- (void)loadData:(NSURL *)withUrl and:(void (^)(NSData * _Nullable jsonData, NSError * _Nullable err))completionHandler{
    [[self.sharedSession dataTaskWithURL:withUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSDictionary * userInfo;
        NSError *err;
        
        //error check
        if (error != nil) {
            userInfo = @{NSLocalizedDescriptionKey: error.localizedDescription};
            err = [[NSError alloc] initWithDomain:@"URL Fetch Error" code:1 userInfo:userInfo];
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(NULL,err);
                return;
            });
        }
        //status check
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
        NSInteger status = [httpResponse statusCode];
        if(status != 200){
            userInfo = @{NSLocalizedDescriptionKey: [NSHTTPURLResponse localizedStringForStatusCode:status]};
            err = [[NSError alloc] initWithDomain:@"Response Error" code:1 userInfo:userInfo];
            dispatch_async(dispatch_get_main_queue(), ^{
                completionHandler(NULL,err);
                return;
            });
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completionHandler(data,NULL);
            return;
        });
        
    }] resume];
}

@end
