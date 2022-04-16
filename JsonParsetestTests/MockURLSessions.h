//
//  MockURLSessions.h
//  JsonParsetestTests
//
//  Created by Paradox Space Rumy M1 on 17/4/22.
//

#import <Foundation/Foundation.h>
#import "NetworkApi.h"

NS_ASSUME_NONNULL_BEGIN

@interface MockURLSessions: NSObject<URLSessionProtocol>
@property NSMutableArray <NSURL *> * _Nonnull dataTaskArgsURL;
@property NSMutableArray <void (^)(NSData * _Nullable, NSURLResponse * _Nullable, NSError * _Nullable)> * _Nonnull completionBlocks;
@property int dataTaskCallCount;
@end

NS_ASSUME_NONNULL_END
