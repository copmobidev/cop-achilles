//
//  LCSectionBillCell.h
//  Achilles
//
//  Created by weiyanen on 13-5-24.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCSectionBillCell : UITableViewCell

@property (nonatomic, weak)IBOutlet UILabel* date;
@property (nonatomic, weak)IBOutlet UILabel* times;
@property (nonatomic, weak) IBOutlet UILabel* oilAmount;
@property (nonatomic, weak) IBOutlet UILabel* perCost;
@property (nonatomic, weak) IBOutlet UILabel* totalCost;
@property (nonatomic, weak)IBOutlet UIImageView *arrow;

- (void)changeArrowWithUp:(BOOL)up;

@end
