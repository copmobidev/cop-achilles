//
//  LCHelpViewController.m
//  Achilles
//
//  Created by weiyanen on 13-6-23.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCHelpViewController.h"

@interface LCHelpViewController ()

@end

@implementation LCHelpViewController

- (IBAction)revealMenu:(id)sender
{
	[self.slidingViewController anchorTopViewTo:ECRight];
}

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
