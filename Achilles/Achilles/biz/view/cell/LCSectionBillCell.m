//
//  LCSectionBillCell.m
//  Achilles
//
//  Created by weiyanen on 13-5-24.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCSectionBillCell.h"

@implementation LCSectionBillCell

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

- (void)changeArrowWithUp:(BOOL)up {
	if (up) {
		self.arrow.image = [UIImage imageNamed:@"accessory_up.png"];
	} else {
		self.arrow.image = [UIImage imageNamed:@"accessory_down.png"];
	}
}

@end
