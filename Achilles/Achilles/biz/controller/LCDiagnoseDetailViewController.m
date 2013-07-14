//
//  LCDiagnoseDetailViewController.m
//  Achilles
//
//  Created by weiyanen on 13-6-25.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCDiagnoseDetailViewController.h"

@interface LCDiagnoseDetailViewController ()

@end

@implementation LCDiagnoseDetailViewController

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

- (IBAction)back:(id)sender {
	[self dismissViewControllerAnimated:YES completion:nil];
}
@end
