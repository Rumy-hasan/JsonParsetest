//
//  NetworkApiTests.m
//  JsonParsetestTests
//
//  Created by Paradox Space Rumy M1 on 16/4/22.
//

#import <Foundation/Foundation.h>
#import <XCTest/XCTest.h>
#import "MockURLSessions.h"
#import "NetworkApi.h"

@interface NetworkApiTest : XCTestCase

@end

@implementation NetworkApiTest


NetworkApi *sut;
MockURLSessions *mockURLSession;
NSURL *url;

- (void)setUp {
    [super setUp];
    mockURLSession = [[MockURLSessions alloc] init];
    sut = [NetworkApi sharedNetworkApi:mockURLSession];
    sut.sharedSession = mockURLSession;
    url = [NSURL URLWithString:@"https://api.publicapis.org/entries"];
}

- (void)tearDown {
    mockURLSession = nil;
    sut = nil;
    url = nil;
    [super tearDown];
}

-(void)test_callNetworkApi_withSuccessResponse_shouldHaveData{
//    [sut loadData:url and:^(NSData * _Nullable jsonData, NSError * _Nullable err) {
//        XCTAssertNotNil(jsonData);
//    }];
//    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"error test"};
//    [mockURLSession.completionBlocks firstObject](nil,nil,[NSError errorWithDomain:@"error" code:1 userInfo:userInfo]);
}

-(void)test_callNetworkApi_withError_shouldReturnError{
    [sut loadData:url and:^(NSData * _Nullable jsonData, NSError * _Nullable err) {
        XCTAssertEqual(err.localizedDescription, @"error test");
    }];
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: @"error test"};
    [mockURLSession.completionBlocks firstObject](nil,nil,[NSError errorWithDomain:@"error" code:1 userInfo:userInfo]);
}


-(void)test_callNetworkApi_withStatusError_shouldReturnStatusError{
    [sut loadData:url and:^(NSData * _Nullable jsonData, NSError * _Nullable err) {
        XCTAssertEqual(err.domain, @"Response Error");
    }];
    [mockURLSession.completionBlocks firstObject](nil,[self response: 500],nil);
}



-(NSHTTPURLResponse *)response: (NSInteger) statusCode{
    return [[NSHTTPURLResponse alloc] initWithURL:[NSURL URLWithString:@"http://DUMMY"] statusCode:statusCode HTTPVersion:nil headerFields:nil];
}


//-(NSData)jsonData{
//
//}



@end
