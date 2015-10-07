//
//  VehicleDetailViewController.m
//  Mileage Pro
//
//  Created by Kris Kata on 10/6/15.
//  Copyright (c) 2015 katak. All rights reserved.
//

#import "VehicleDetailViewController.h"
#import "Vehicle.h"

@interface VehicleDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *makeField;
@property (weak, nonatomic) IBOutlet UITextField *modelField;
@property (weak, nonatomic) IBOutlet UITextField *colorField;
@property (weak, nonatomic) IBOutlet UITextField *yearField;

@end

@implementation VehicleDetailViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    Vehicle *vehicle = self.vehicle;
    
    self.nameField.text = vehicle.name;
    self.makeField.text = vehicle.make;
    self.modelField.text = vehicle.model;
    self.colorField.text = vehicle.color;
    self.yearField.text = [NSString stringWithFormat:@"%d", vehicle.year];
}

@end
