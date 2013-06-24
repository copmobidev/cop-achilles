//
//  LCNotificationCell.h
//  Achilles
//
//  Created by weiyanen on 13-6-24.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCNotificationCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *upLine;

@property (weak, nonatomic) IBOutlet UIImageView *downLine;

@property (weak, nonatomic) IBOutlet UIImageView *notificationBackgroundView;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;


@end
