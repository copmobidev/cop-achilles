//
//  SampleTableViewController.m
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 2/13/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import "LCSettingsViewController.h"
#import "LCSettingCell.h"
#import "LCAccountViewController.h"

@interface LCSettingsViewController()
@property (nonatomic, strong) NSArray *settingsItems;
@end

@implementation LCSettingsViewController

#pragma mark - Data Model

- (NSArray *)settingsItems {
	if (!_settingsItems) {
		_settingsItems = [NSArray arrayWithObjects:@{@"name":@"flux", @"displayName":@"流量保护", @"description":@"保护无线流量，只在接入Wifi时同步数据"}, @{@"name":@"cache", @"displayName":@"缓存自动清理", @"description":@"本地缓存超过一定量自动清理，必要时需要从云端下载"}, nil];
	}
	return _settingsItems;
}

#pragma mark - UIViewController

- (void)viewDidLoad {
	self.settingsTableView.dataSource = self;
	self.settingsTableView.delegate = self;
}

- (void)awakeFromNib {}

#pragma mark - UITableViewController DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)sectionIndex
{
  return self.settingsItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  NSString *cellIdentifier = @"LCSettingCell";
  LCSettingCell *cell = (LCSettingCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (cell == nil) {
	  cell = [[[NSBundle mainBundle] loadNibNamed:cellIdentifier
											owner:self
										  options:nil] objectAtIndex:0];
  }
  
	cell.displayLabel.text = [[self.settingsItems objectAtIndex:indexPath.row] objectForKey:@"displayName"];
	cell.descriptionLabel.text = [[self.settingsItems objectAtIndex:indexPath.row] objectForKey:@"description"];
	
  return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	return 100.0f;
}

#pragma mark - UITableView Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
}

#pragma mark - Action

- (IBAction)revealMenu:(id)sender
{
  [self.slidingViewController anchorTopViewTo:ECRight];
}

@end
