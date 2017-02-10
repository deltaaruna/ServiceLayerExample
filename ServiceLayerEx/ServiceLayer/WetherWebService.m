//
//  WetherWebService.m
//  Weather
//
//  Created by mr aruna withanage on 5/1/15.
//  Copyright (c) 2015 aruna withanage. All rights reserved.
//

#import "WetherWebService.h"
#import "WeatherServieJasonSerializer.h"

static NSString * const baseURLString = @"http://www.raywenderlich.com/demos/weather_sample/";

@implementation WetherWebService

+ (WetherWebService*)getSharedInstance {
    static WetherWebService *sharedInstance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [[WetherWebService alloc] initWithBaseURL:[NSURL URLWithString:baseURLString]];
        sharedInstance.responseSerializer = [WeatherServieJasonSerializer serializer];
    });
    
    return sharedInstance;
}

- (void)callService:(NSDictionary*)parameters withCompletionBlock:(void(^)(NSArray *resultArray, NSError *error))completionBlock {
    [self GET:@"weather.php" parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        completionBlock(responseObject, nil);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        completionBlock(nil, error);
    }];
}

@end
