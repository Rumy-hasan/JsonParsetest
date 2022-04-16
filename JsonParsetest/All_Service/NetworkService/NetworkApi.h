//
//  NetworkApi.h
//  JsonParsetest
//
//  Created by Paradox Space Rumy M1 on 13/4/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
///declare protocol
///- dataTaskWithURL method
@protocol URLSessionProtocol<NSObject>
- (NSURLSessionDataTask *)dataTaskWithURL:(NSURL *)url completionHandler:(void (^)(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error))completionHandler;
@end

@interface NSURLSession()<URLSessionProtocol>{
    
}

@end


///NetworkApi implementation
@interface NetworkApi : NSObject
+ (id)sharedNetworkApi:(id<URLSessionProtocol>)session;
- (void)loadData:(NSURL *) withUrl and:(void (^)(NSData  * _Nullable jsonData, NSError * _Nullable err))completionHandler;
@property (nonatomic, strong) id<URLSessionProtocol> sharedSession;
@end

NS_ASSUME_NONNULL_END
