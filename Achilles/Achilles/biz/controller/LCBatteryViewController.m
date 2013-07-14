//
//  LCBatteryViewController.m
//  Achilles
//
//  Created by weiyanen on 13-7-14.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCBatteryViewController.h"

@interface LCBatteryViewController ()

@end

@implementation LCBatteryViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//pre ios6
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
	return toInterfaceOrientation == UIInterfaceOrientationLandscapeRight;
}

//ios6
- (BOOL)shouldAutorotate {
	return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscapeRight;
}


- (IBAction)back:(id)sender {
	[self dismissViewControllerAnimated:YES completion:Nil];
}
@end
