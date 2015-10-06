//
//  ViewController.m
//  Mileage Pro
//
//  Created by Kris Kata on 10/5/15.
//  Copyright (c) 2015 katak. All rights reserved.
//

#import "VehicleTableViewController.h"
#import "Vehicle.h"

@interface VehicleTableViewController ()

@property (nonatomic) NSMutableArray *privateVehicles;

@end

@implementation VehicleTableViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (!self.privateVehicles) {
        self.privateVehicles = [[NSMutableArray alloc] init];
    }
    if (self) {
        for (int i = 0; i < 5; i++) {
            Vehicle *vehicle = [[Vehicle alloc] initWithName:@"My Car"
                                                        make:@"Mazda"
                                                       model:@"3"
                                                        year:2012
                                                       color:@"Indigo"];
            [self.privateVehicles addObject:vehicle];
        }
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSLog(@"%lu", (unsigned long)[self.privateVehicles count]);
    return [self.privateVehicles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    Vehicle *vehicle = self.privateVehicles[indexPath.row];
    
    cell.textLabel.text = [vehicle description];
    NSLog(@"%@", cell.textLabel.text);
    return cell;
}

@end
