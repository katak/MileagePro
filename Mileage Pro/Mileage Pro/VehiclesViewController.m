//
//  ViewController.m
//  Mileage Pro
//
//  Created by Kris Kata on 10/5/15.
//  Copyright (c) 2015 katak. All rights reserved.
//

#import "VehiclesViewController.h"
#import "VehicleDetailViewController.h"
#import "Vehicle.h"

@interface VehiclesViewController ()

@property (nonatomic) NSMutableArray *privateVehicles;

@end

@implementation VehiclesViewController

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VehicleDetailViewController *vdvc = [[VehicleDetailViewController alloc] init];
    Vehicle *selectedVehicle = self.privateVehicles[indexPath.row];
    vdvc.vehicle = selectedVehicle;
    [self.navigationController pushViewController:vdvc animated:YES];
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
