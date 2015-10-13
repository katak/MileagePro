//
//  VehicleDetailViewController.h
//  Mileage Pro
//
//  Created by Kris Kata on 10/6/15.
//  Copyright (c) 2015 katak. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Vehicle;

@interface VehicleDetailViewController : UIViewController

- (instancetype)initForNewVehicle:(BOOL)isNew;

@property (nonatomic, strong) Vehicle *vehicle;
@property (nonatomic, copy) void (^dismissBlock)(void);

@end
