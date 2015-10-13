//
//  ViewController.m
//  Mileage Pro
//
//  Created by Kris Kata on 10/5/15.
//  Copyright (c) 2015 katak. All rights reserved.
//

#import "VehiclesViewController.h"
#import "VehicleDetailViewController.h"
#import "VehicleStore.h"
#import "Vehicle.h"

@implementation VehiclesViewController

- (instancetype)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    
    if (self) {
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"My Vehicles";

        UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addVehicle)];
        self.navigationItem.rightBarButtonItem = addButton;
        
        for (int i = 0; i < 5; i++) {
            [[VehicleStore sharedStore] createVehicle];
        }
    }
    
    return self;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    return [self init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    self.tableView.allowsMultipleSelectionDuringEditing = NO;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)addVehicle
{
    Vehicle *newVehicle = [[VehicleStore sharedStore] createVehicle];

    VehicleDetailViewController *detailViewController = [[VehicleDetailViewController alloc] initForNewVehicle:YES];
    detailViewController.vehicle = newVehicle;
    
    detailViewController.dismissBlock = ^{
        [self.tableView reloadData];
    };
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:detailViewController];
    
    [self presentViewController:navController animated:YES completion:NULL];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    VehicleDetailViewController *vdvc = [[VehicleDetailViewController alloc] initForNewVehicle:NO];

    NSArray *vehicles = [[VehicleStore sharedStore] allVehicles];
    Vehicle *selectedVehicle = vehicles[indexPath.row];

    vdvc.vehicle = selectedVehicle;
    [self.navigationController pushViewController:vdvc animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[[VehicleStore sharedStore] allVehicles] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    NSArray *vehicles = [[VehicleStore sharedStore] allVehicles];
    Vehicle *vehicle = vehicles[indexPath.row];
    
    cell.textLabel.text = [vehicle description];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        NSArray *vehicles = [[VehicleStore sharedStore] allVehicles];
        Vehicle *vehicle = vehicles[indexPath.row];
        
        [[VehicleStore sharedStore] deleteVehicle:vehicle];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end
