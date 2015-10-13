//
//  VehicleImageStore.m
//  Mileage Pro
//
//  Created by Kris Kata on 10/12/15.
//  Copyright (c) 2015 katak. All rights reserved.
//

#import "VehicleImageStore.h"

@interface VehicleImageStore ()

@property (nonatomic, strong) NSMutableDictionary *dictionary;

@end

@implementation VehicleImageStore

+ (instancetype)sharedStore
{
    static VehicleImageStore *sharedStore;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStore = [[self alloc] initPrivate];
    });
    
    return sharedStore;
}

- (instancetype)init
{
    [NSException raise:@"Singleton" format:@"Use +[VehicleImageStore sharedStore]"];
    return nil;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    if (self) {
        _dictionary = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
    self.dictionary[key] = image;
}

- (UIImage *)imageForKey:(NSString *)key
{
    return self.dictionary[key];
}

- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}

@end
