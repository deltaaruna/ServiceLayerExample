//
//  ViewController.h
//  ServiceLayerEx
//
//  Created by mr aruna withanage on 5/1/15.
//  Copyright (c) 2015 Aruna Withanage. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, weak) IBOutlet UITableView *weatherTable;
@property(nonatomic, strong) NSArray *tableArray;

@end

