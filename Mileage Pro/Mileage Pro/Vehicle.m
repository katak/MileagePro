//
//  Vehicle.m
//  Mileage Pro
//
//  Created by Kris Kata on 10/5/15.
//  Copyright (c) 2015 katak. All rights reserved.
//

#import "Vehicle.h"

@implementation Vehicle

- (instancetype)initWithName:(NSString *)name
{
    _name = name;
    return self;
}

- (instancetype)initWithName:(NSString *)name
                        make:(NSString *)make
                       model:(NSString *)model
                        year:(int)year
                       color:(NSString *)color
{
    _name = name;
    _make = make;
    _model = model;
    _year = year;
    _color = color;
    
    NSUUID *uuid = [[NSUUID alloc] init];
    NSString *key = [uuid UUIDString];
    _vehicleKey = key;
    
    return self;
}

- (NSString *)description
{
    NSString *descriptionString = [NSString stringWithFormat:@"%d %@ %@", self.year, self.make, self.model];
    return descriptionString;
}

@end
