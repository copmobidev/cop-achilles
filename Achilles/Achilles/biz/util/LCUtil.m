//
//  LCUtil.m
//  Achilles
//
//  Created by weiyanen on 13-7-29.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCUtil.h"

@implementation LCUtil

+ (UIAlertView *)simpleAlertViewWithTitle:(NSString *)title withMessage:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:message delegate:delegate cancelButtonTitle:cancelButtonTitle otherButtonTitles:otherButtonTitles];
	
	[alert show];
}

@end
