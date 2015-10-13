//
//  VehicleImageStore.h
//  Mileage Pro
//
//  Created by Kris Kata on 10/12/15.
//  Copyright (c) 2015 katak. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface VehicleImageStore : NSObject

+ (instancetype)sharedStore;

- (void)setImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *)imageForKey:(NSString *)key;
- (void)deleteImageForKey:(NSString *)key;

@end
