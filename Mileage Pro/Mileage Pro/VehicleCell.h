//
//  VehicleCell.h
//  Mileage Pro
//
//  Created by Kris Kata on 10/15/15.
//  Copyright (c) 2015 katak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface VehicleCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *trimLabel;

@end
