//
//  ViewController.m
//  ServiceLayerEx
//
//  Created by mr aruna withanage on 5/1/15.
//  Copyright (c) 2015 Aruna Withanage. All rights reserved.
//

#import "ViewController.h"
#import "ServiceLayerFacade.h"
#import "Service.h"
#import "WeatherInfo+TableRepresentation.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _weatherTable.dataSource = self;
    _weatherTable.delegate = self;
    
    NSDictionary *parameters = @{@"format": @"json"};
    ServiceLayerFacade *serviceLayer = [ServiceLayerFacade getSharedInstance];
    id<Service> weatherWebService = [serviceLayer getWeatherService];
    [weatherWebService callService:parameters withCompletionBlock:^(NSArray *resultArray, NSError *error) {
        if (resultArray[0] != nil) {
            id<TableLayout> tableModel = resultArray[0];
            _tableArray = [tableModel getTableRepresentation];
            [_weatherTable reloadData];
        }
    }];
    self.weatherTable.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

#pragma TableView delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(_tableArray && _tableArray.count > 0) {
        return _tableArray.count;
    } else {
        return 1;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView_ cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView_ dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    if (_tableArray && _tableArray.count > 0) {
        cell.textLabel.text =  [((NSNumber*)_tableArray[indexPath.row]) stringValue];
    }
    
    return cell;
}

@end
