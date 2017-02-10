//
//  ServiceLayerFacade.h
//  Weather
//
//  Created by mr aruna withanage on 5/1/15.
//  Copyright (c) 2015 aruna withanage. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Service.h"


@interface ServiceLayerFacade : NSObject

+ (ServiceLayerFacade*)getSharedInstance;
- (id<Service>)getWeatherService;

@end
