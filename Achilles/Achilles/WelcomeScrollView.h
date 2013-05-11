//
//  WelcomeScrollView.h
//  Achilles
//
//  Created by weiyanen on 13-5-11.
//  Copyright (c) 2013年 weiyanen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WelcomeScrollView : UIScrollView 

@property (nonatomic, strong) UIPageControl *pageControll;

@property (nonatomic, assign) UIInterfaceOrientation lastOrientation;

@end
