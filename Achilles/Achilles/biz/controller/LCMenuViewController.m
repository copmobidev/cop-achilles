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

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property (nonatomic, strong) NSIndexPath *lastIndexPath;
@end

@implementation LCMenuViewController

- (void)awakeFromNib
{
	self.menuItems = @[
  @{@"name":@"Home", @"displayName":@"首页", @"imageName":@"menu_icon1.png"},
  @{@"name":@"Route", @"displayName":@"行程信息", @"imageName":@"menu_icon2.png"},
  @{@"name":@"Driving", @"displayName":@"绿色驾驶", @"imageName":@"menu_icon3.png"},
  @{@"name":@"Consume", @"displayName":@"油耗分析", @"imageName":@"menu_icon4.png"},
  @{@"name":@"Bill", @"displayName":@"加油统计", @"imageName":@"menu_icon5.png"},
  @{@"name":@"Navigation", @"displayName":@"我的账号", @"imageName":@"menu_icon6.png"},
  @{@"name":@"Diagnose", @"displayName":@"车辆体检", @"imageName":@"menu_icon7.png"},
  @{@"name":@"Help", @"displayName":@"相关帮助", @"imageName":@"menu_icon8.png"}
  ];
}

- (void)viewDidLoad
{
  [super viewDidLoad];
	self.revealRightAmount = 200.f;
  [self.slidingViewController setAnchorRightRevealAmount:self.revealRightAmount];
  self.slidingViewController.underLeftWidthLayout = ECFullWidth;
//	self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1_bg.png"]];
//	self.tableView.backgroundColor = [UIColor redColor];
	[self.navigationBar setBackgroundImage:[UIImage imageNamed:@"logo.png"] forBarMetrics:UIBarMetricsDefault];
	self.lastIndexPath = nil;
	self.tableView.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"menu_bg.png"]];
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
	//	cell.backgroundColor = [UIColor grayColor];
//	cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_normal.png"]];
	cell.nameLabel.text = [[self.menuItems objectAtIndex:indexPath.row] valueForKey:@"displayName"];
	cell.thumbnail.image = [UIImage imageNamed:[[self.menuItems objectAtIndex:indexPath.row] objectForKey:@"imageName"]];
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
	
	if (self.lastIndexPath && self.lastIndexPath.row != indexPath.row) {
		LCMenuItemCell *lastCell = (LCMenuItemCell *)[tableView cellForRowAtIndexPath:self.lastIndexPath];
		lastCell.backgroundView = nil;
	}
	if (self.lastIndexPath == nil || self.lastIndexPath.row != indexPath.row) {
		LCMenuItemCell * cell = (LCMenuItemCell *)[tableView cellForRowAtIndexPath:indexPath];
		cell.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cell_selected.png"]];
		self.lastIndexPath = indexPath;
	}
	
	
}

- (void)viewDidUnload {
	[self setTableView:nil];
	[self setNavigationBar:nil];
	[self setNavigationBar:nil];
	[super viewDidUnload];
}
@end
