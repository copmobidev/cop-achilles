//
//  LCArcImageView.h
//  Achilles
//
//  Created by weiyanen on 13-6-30.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCArcView : UIView

@property (nonatomic, assign) CGFloat startAngle;

@property (nonatomic, assign) CGFloat endAngle;

@property (nonatomic, assign) CGPoint center;

@property (nonatomic, assign) CGFloat radius;

@property (nonatomic, assign) BOOL isClockWise;

- (void)setShape;

@end
