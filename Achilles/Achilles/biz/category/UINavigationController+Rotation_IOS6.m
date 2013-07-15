//
//  UINavigationController+Rotation_IOS6.m
//  Achilles
//
//  Created by weiyanen on 13-7-14.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "UINavigationController+Rotation_IOS6.h"

@implementation UINavigationController (Rotation_IOS6)

-(BOOL)shouldAutorotate
{
    return [[self.viewControllers lastObject] shouldAutorotate];
}

-(NSUInteger)supportedInterfaceOrientations
{
    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
	return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}
@end
