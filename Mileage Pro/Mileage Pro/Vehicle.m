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

- (void)setThumbnailFromImage:(UIImage *)image
{
    CGSize originalImageSize = image.size;
    
    CGRect newRect = CGRectMake(0, 0, 40, 40);
    
    float ratio = MAX(newRect.size.width / originalImageSize.width, newRect.size.height / originalImageSize.height);
    
    UIGraphicsBeginImageContextWithOptions(newRect.size, NO, 0.0);
    
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:newRect cornerRadius:5.0];
    
    [path addClip];
    
    CGRect projectRect;
    projectRect.size.width = ratio * originalImageSize.width;
    projectRect.size.height = ratio * originalImageSize.height;
    projectRect.origin.x = (newRect.size.width - projectRect.size.width) / 2.0;
    projectRect.origin.y = (newRect.size.height - projectRect.size.height) / 2.0;
    
    [image drawInRect:projectRect];
    
    UIImage *smallImage = UIGraphicsGetImageFromCurrentImageContext();
    self.thumbnail = smallImage;
    
    UIGraphicsEndImageContext();
}

- (NSString *)description
{
    NSString *descriptionString = [NSString stringWithFormat:@"%d %@ %@", self.year, self.make, self.model];
    return descriptionString;
}

@end
