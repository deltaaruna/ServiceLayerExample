//
//  ServiceLayerFacade.m
//  Weather
//
//  Created by mr aruna withanage on 5/1/15.
//  Copyright (c) 2015 aruna withanage. All rights reserved.
//

#import "ServiceLayerFacade.h"
#import "WetherWebService.h"

@implementation ServiceLayerFacade

+ (ServiceLayerFacade*)getSharedInstance {
    static ServiceLayerFacade *sharedInstance = nil;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        sharedInstance = [[ServiceLayerFacade alloc] init];
    });
    
    return sharedInstance;
}
- (id<Service>)getWeatherService {
    return [WetherWebService getSharedInstance];
}

@end
