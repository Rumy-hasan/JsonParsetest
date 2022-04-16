//
//  NetworkHandler.h
//  JsonParsetest
//
//  Created by Paradox Space Rumy M1 on 13/4/22.
//

#import <Foundation/Foundation.h>
#import "Model.h"
#import "NetworkApi.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetworkHandler : NSObject
- (void)fetchData:(NSString *)withUrl at:(void (^)(NSMutableArray<Model *>  * _Nullable model, NSError * _Nullable err))completion;
@end

NS_ASSUME_NONNULL_END
