//
//  LCBizSpanViewController.m
//  Achilles
//
//  Created by weiyanen on 13-5-27.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCBizSpanViewController.h"
#import "LCSpanTableController.h"

@interface LCBizSpanViewController ()

@end

@implementation LCBizSpanViewController

-(IBAction)popover:(id)sender
{
    //the view controller you want to present as popover
    LCSpanTableController *controller = [[LCSpanTableController alloc] init];
	controller.delegate = self;
	
    //our popover
    self.popover = [[FPPopoverController alloc] initWithViewController:controller];
	self.popover.delegate = self;
	self.popover.contentSize = CGSizeMake(150, 215);
    //the popover will be presented from the okButton view
    [self.popover presentPopoverFromView:[sender valueForKey:@"view"]];
}

#pragma mark - LCSpanTableController Delegate

- (void)selectedTableRow:(NSUInteger)row {
	// 1 - To Do , 全局变量和持久化
	
	// 2 - dismiss popover
	[self.popover dismissPopoverAnimated:YES];
}


#pragma mark - Popover Delegate Message

- (void)presentedNewPopoverController:(FPPopoverController *)newPopoverController
          shouldDismissVisiblePopover:(FPPopoverController*)visiblePopoverController
{
    [visiblePopoverController dismissPopoverAnimated:YES];
}

- (void)popoverControllerDidDismissPopover:(FPPopoverController *)popoverController {
	
}
@end
