//
//  VehicleStore.h
//  Mileage Pro
//
//  Created by Kris Kata on 10/9/15.
//  Copyright (c) 2015 katak. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Vehicle;

@interface VehicleStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allVehicles;

+ (instancetype)sharedStore;
- (Vehicle *)createVehicle;
- (void)deleteVehicle:(Vehicle *)vehicle;
@end
