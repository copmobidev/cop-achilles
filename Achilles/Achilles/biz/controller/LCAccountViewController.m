//
//  LCAccountViewController.m
//  Achilles
//
//  Created by weiyanen on 13-5-26.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCAccountViewController.h"
#import "SVSegmentedControl.h"

@interface LCAccountViewController ()

@end

@implementation LCAccountViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	
	SVSegmentedControl *navSC = [[SVSegmentedControl alloc] initWithSectionTitles:[NSArray arrayWithObjects:@"男", @"女", nil]];
    navSC.changeHandler = ^(NSUInteger newIndex) {
        NSLog(@"segmentedControl did select index %i (via block handler)", newIndex);
    };
    
	[self.inputView addSubview:navSC];

	navSC.center = CGPointMake(160, 140);
}

- (IBAction)editProfile:(id)sender {
}
- (void)viewDidUnload {
	[self setInputView:nil];
	[super viewDidUnload];
}

- (void)resignKeyBoardInView:(UIView *)view
{
//    for (UIView *v in self.view) {
//        if ([v.subviews count] > 0) {
//            [self resignKeyBoardInView:v];
//        }
//		
//        if ([v isKindOfClass:[UITextView class]] || [v isKindOfClass:[UITextField class]]) {
//            [v resignFirstResponder];
//        }
//    }
}
@end
