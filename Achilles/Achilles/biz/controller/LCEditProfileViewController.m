//
//  LCEditProfileViewController.m
//  Achilles
//
//  Created by weiyanen on 13-6-2.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCEditProfileViewController.h"

@interface LCEditProfileViewController ()

@end

@implementation LCEditProfileViewController

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

- (IBAction)cancel:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}

- (IBAction)save:(id)sender {
	[self dismissModalViewControllerAnimated:YES];
}
@end
