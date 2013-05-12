//
//  InitialSlidingViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/25/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "InitialSlidingViewController.h"

@implementation InitialSlidingViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIStoryboard *storyboard;
  
  storyboard = [UIStoryboard storyboardWithName:@"iPhone" bundle:nil];
  
  self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"LCHome"];


}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
  return YES;
}

@end
