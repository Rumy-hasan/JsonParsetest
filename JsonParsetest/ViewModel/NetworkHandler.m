//
//  NetworkHandler.m
//  JsonParsetest
//
//  Created by Paradox Space Rumy M1 on 13/4/22.
//

#import "NetworkHandler.h"
//#import "NetworkApi.h"
#import "NetworkApi.h"

///responsible to interect with networkService api
@implementation NetworkHandler


- (void)fetchData:(NSString *)withUrl at:(void (^)(NSMutableArray<Model *> * _Nullable, NSError * _Nullable))completion{
    NSURL *url = [NSURL URLWithString:withUrl];
    [[NetworkApi sharedNetworkApi:NSURLSession.sharedSession] loadData:url and:^(NSData * _Nullable jsonData, NSError * _Nullable err) {
        if (err != nil) {
            completion(NULL,err);
            return;
        }
        NSError *errs;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingAllowFragments error: &errs];
        if (errs != nil) {
            NSDictionary *userInfo = @{NSLocalizedDescriptionKey: err.localizedDescription};
            NSError *err = [[NSError alloc] initWithDomain:@"Data Corruption Error" code:1 userInfo:userInfo];
            completion(NULL,err);
            return;
        }
        NSMutableArray <Model *> *modelData = NSMutableArray.new;
        NSArray *a = dic[@"entries"];
        for (NSDictionary *d in a) {
            NSString *apiDescription  = d[@"Description"];
            NSString *api = d[@"API"];
            Model *singleModel = Model.new;
            singleModel.apiDescription = apiDescription;
            singleModel.apiName = api;
            [modelData addObject:singleModel];
        }
        completion(modelData,NULL);
        return;
    }];
}


@end
