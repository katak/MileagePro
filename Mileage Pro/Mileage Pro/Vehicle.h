//
//  Vehicle.h
//  Mileage Pro
//
//  Created by Kris Kata on 10/5/15.
//  Copyright (c) 2015 katak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vehicle : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *make;
@property (nonatomic, copy) NSString *model;
@property (nonatomic) int year;
@property (nonatomic, copy) NSString *color;

- (instancetype)initWithName:(NSString *)name;
- (instancetype)initWithName:(NSString *)name
                        make:(NSString *)make
                       model:(NSString *)model
                        year:(int)year
                       color:(NSString *)color;
- (NSString *)description;

@end
