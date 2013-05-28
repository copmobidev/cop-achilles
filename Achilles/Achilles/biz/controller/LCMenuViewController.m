//
//  MenuViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "LCMenuViewController.h"
#import "LCMenuItemCell.h"

@interface LCMenuViewController()
@property (nonatomic, strong) NSArray *menuItems;
@property (nonatomic, assign) CGFloat revealRightAmount;
@end

@implementation LCMenuViewController

- (void)awakeFromNib
{
	self.menuItems = @[@{@"name":@"Home", @"displayName":@"首页"}, @{@"name":@"Route", @"displayName":@"行程"}, @{@"name":@"Driving", @"displayName":@"驾驶"}, @{@"name":@"Consume", @"displayName":@"油耗"}, @{@"name":@"Bill", @"displayName":@"账单"}, @{@"name":@"Diagnose", @"displayName":@"诊断"}, @{@"name":@"Navigation", @"displayName":@"设置"}];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
	self.revealRightAmount = 120.f;
  [self.slidingViewController setAnchorRightRevealAmount:self.revealRightAmount];
  self.slidingViewController.underLeftWidthLayout = ECFullWidth;
}

#pragma mark - UITableView DataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
  return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *cellIdentifier = @"LCMenuItemCell";
  LCMenuItemCell *cell = (LCMenuItemCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (cell == nil) {
	  cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier
											owner:self
										  options:nil] objectAtIndex:0];  }

  cell.nameLabel.text = [[self.menuItems objectAtIndex:indexPath.row] valueForKey:@"displayName"];
//	cell.thumbnail.image = [UIImage imageNamed:@"car.png"];
  return cell;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *identifier = [NSString stringWithFormat:@"LC%@", [[self.menuItems objectAtIndex:indexPath.row] valueForKey:@"name"]];

  UIViewController *newTopViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];
  
  [self.slidingViewController anchorTopViewOffScreenTo:ECRight animations:nil onComplete:^{
    CGRect frame = self.slidingViewController.topViewController.view.frame;
    self.slidingViewController.topViewController = newTopViewController;
    self.slidingViewController.topViewController.view.frame = frame;
    [self.slidingViewController resetTopView];
  }];
	
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
