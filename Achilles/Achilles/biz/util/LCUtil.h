//
//  LCUtil.h
//  Achilles
//
//  Created by weiyanen on 13-7-29.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LCUtil : NSObject
+ (UIAlertView *)simpleAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles;
@end
