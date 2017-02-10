//
//  WeatherServieJasonSerializer.m
//  Weather
//
//  Created by mr aruna withanage on 5/1/15.
//  Copyright (c) 2015 aruna withanage. All rights reserved.
//

#import "WeatherServieJasonSerializer.h"
#import "WeatherInfo.h"

@implementation WeatherServieJasonSerializer

- (id)responseObjectForResponse:(NSURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error {
    NSMutableArray *retArray = [[NSMutableArray alloc] init];
    NSDictionary *json = [super responseObjectForResponse:response data:data error:error];
    NSDictionary *dictionary = json[@"data"];
    WeatherInfo *infoRet = [[WeatherInfo alloc] init];
    NSArray *arrData = dictionary[@"weather"];
    
    infoRet.tempMaxC = @([((NSString*)((NSDictionary*)arrData[0])[@"tempMaxC"]) integerValue]);
    infoRet.tempMaxF = @([((NSString*)((NSDictionary*)arrData[0])[@"tempMaxF"]) integerValue]);
    infoRet.tempMinC = @([((NSString*)((NSDictionary*)arrData[0])[@"tempMinC"]) integerValue]);
    infoRet.tempMinF = @([((NSString*)((NSDictionary*)arrData[0])[@"tempMinF"]) integerValue]);
    
    [retArray addObject:infoRet];
    
    return retArray;
}

@end
