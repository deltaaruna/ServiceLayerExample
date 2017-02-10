//
//  WeatherInfo+TableRepresentation.m
//  ServiceLayerEx
//
//  Created by mr aruna withanage on 5/1/15.
//  Copyright (c) 2015 Aruna Withanage. All rights reserved.
//

#import "WeatherInfo+TableRepresentation.h"

@implementation WeatherInfo (TableRepresentation)

-(NSArray*)getTableRepresentation {
    return [[NSArray alloc] initWithObjects:self.tempMaxC,self.tempMaxF,self.tempMinC,self.tempMinF, nil];
}

@end
