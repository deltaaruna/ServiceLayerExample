//
//  Service.h
//  Weather
//
//  Created by mr aruna withanage on 5/1/15.
//  Copyright (c) 2015 aruna withanage. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol Service <NSObject>

- (void)callService:(NSDictionary*)parameters withCompletionBlock:(void(^)(NSArray *resultArray, NSError *error))completionBlock;

@end
