//
//  LTDiagnoseCell.m
//  CarMonitor
//
//  Created by ChrisLiu  on 3/21/13.
//  Copyright (c) 2013 ChrisLiu . All rights reserved.
//

#import "LCDiagnoseCell.h"

@implementation LCDiagnoseCell

@synthesize icon, title;

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

@end
