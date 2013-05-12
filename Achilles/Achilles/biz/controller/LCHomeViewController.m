//
//  FirstTopViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "LCHomeViewController.h"
#import "RegisterController.h"
#import "RegisterStatus.h"

@implementation LCHomeViewController
- (void)viewDidAppear:(BOOL)animated {
//	if (![LoginStatus getInstance].isLogin) {
//		QRootElement *root = [[QRootElement alloc] initWithJSONFile:@"loginform"];
//		
//		UINavigationController *navigation = [QuickDialogController controllerWithNavigationForRoot:root];
//		[self presentModalViewController:navigation animated:NO];
//	}
	
	if (![RegisterStatus sharedInstance].isRegisterd) {
		[RegisterStatus sharedInstance].isRegisterd = YES;
		RegisterController *registerController = [[RegisterController alloc] init];
		[self presentModalViewController:registerController animated:NO];
	}	
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  // shadowPath, shadowOffset, and rotation is handled by ECSlidingViewController.
  // You just need to set the opacity, radius, and color.
  self.view.layer.shadowOpacity = 0.75f;
  self.view.layer.shadowRadius = 10.0f;
  self.view.layer.shadowColor = [UIColor blackColor].CGColor;

  if (![self.slidingViewController.underLeftViewController isKindOfClass:[LCMenuViewController class]]) {
    self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuLeft"];
  }
  
  if (![self.slidingViewController.underRightViewController isKindOfClass:[UnderRightViewController class]]) {
    self.slidingViewController.underRightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"UnderRight"];
  }
  
  [self.view addGestureRecognizer:self.slidingViewController.panGesture];
	

	
}

- (IBAction)revealMenu:(id)sender
{
  [self.slidingViewController anchorTopViewTo:ECRight];
}

- (IBAction)revealUnderRight:(id)sender
{
  [self.slidingViewController anchorTopViewTo:ECLeft];
}

@end