//
//  WetherWebService.h
//  Weather
//
//  Created by mr aruna withanage on 5/1/15.
//  Copyright (c) 2015 aruna withanage. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "Service.h"

@interface WetherWebService : AFHTTPSessionManager<Service>

+ (WetherWebService*)getSharedInstance;

@end
