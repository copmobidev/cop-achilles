//
//  LCSubBillCell.h
//  Achilles
//
//  Created by weiyanen on 13-5-24.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCSubBillCell : UITableViewCell

@property (nonatomic, weak)IBOutlet UILabel* date;
@property (nonatomic, weak) IBOutlet UILabel* oil;
@property (nonatomic, weak) IBOutlet UILabel* perCost;

@property (nonatomic, weak) IBOutlet UILabel* totalCost;

@end
