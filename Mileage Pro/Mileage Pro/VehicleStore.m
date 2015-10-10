//
//  VehicleStore.m
//  Mileage Pro
//
//  Created by Kris Kata on 10/9/15.
//  Copyright (c) 2015 katak. All rights reserved.
//

#import "VehicleStore.h"
#import "Vehicle.h"

@interface VehicleStore ()

@property (nonatomic) NSMutableArray *privateVehicles;

@end

@implementation VehicleStore

+ (instancetype)sharedStore
{
    static VehicleStore *sharedStore;
    
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    
    return sharedStore;
}

- (instancetype)init
{
    [NSException raise:@"Singleton" format:@"User +[VehicleStore sharedStore]"];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _privateVehicles = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allVehicles
{
    return [self.privateVehicles copy];
}

- (Vehicle *)createVehicle
{
    Vehicle *vehicle = [[Vehicle alloc] initWithName:@"My Car"
                                                make:@"Mazda"
                                               model:@"3"
                                                year:2012
                                               color:@"Indigo"];

    [self.privateVehicles addObject:vehicle];
    
    return vehicle;
}

- (void)deleteVehicle:(Vehicle *)vehicle
{
    [self.privateVehicles removeObjectIdenticalTo:vehicle];
}

@end
