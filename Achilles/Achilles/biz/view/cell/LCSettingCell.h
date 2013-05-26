//
//  LCSettingCell.h
//  Achilles
//
//  Created by weiyanen on 13-5-26.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCSettingCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *displayLabel;

@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (weak, nonatomic) IBOutlet UISwitch *settingSwitch;

- (IBAction)switchChanged:(id)sender;

@end
