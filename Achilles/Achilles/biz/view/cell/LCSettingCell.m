//
//  LCSettingCell.m
//  Achilles
//
//  Created by weiyanen on 13-5-26.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCSettingCell.h"

@implementation LCSettingCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)switchChanged:(id)sender {
}
@end
