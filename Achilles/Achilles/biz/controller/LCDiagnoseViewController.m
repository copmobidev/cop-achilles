//
//  LCDiagnoseViewController.m
//  Achilles
//
//  Created by weiyanen on 13-5-19.
//  Copyright (c) 2013年 cop-studio. All rights reserved.
//

#import "LCDiagnoseViewController.h"

@interface LCDiagnoseViewController ()

@end

@implementation LCDiagnoseViewController

#pragma mark - UIViewController

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	
	if (![self.slidingViewController.underLeftViewController isKindOfClass:[LCMenuViewController class]]) {
		self.slidingViewController.underLeftViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
	}
	self.slidingViewController.underRightViewController = nil;
	
	[self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (IBAction)revealMenu:(id)sender
{
	[self.slidingViewController anchorTopViewTo:ECRight];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UIImage *image = [UIImage imageNamed:@"bg_texture.png"];
    self.view.layer.contents = (id)image.CGImage;
    self.diagnoseTableView.sectionFooterHeight = 0;
    self.diagnoseTableView.sectionHeaderHeight = 0;
    [self.diagnoseTableView setDataSource:self];
    [self.diagnoseTableView setDelegate:self];
    
    NSString* path = [[NSBundle mainBundle] pathForResource:@"diagnose" ofType:@"plist"];
    _diagnoseItems = [[NSMutableArray alloc] initWithContentsOfFile:path];
}


#pragma mark - UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 35;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_diagnoseItems count];
}

- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"LCDiagnoseCell";
    LCDiagnoseCell *cell = (LCDiagnoseCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (!cell)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier
                                              owner:self
                                            options:nil] objectAtIndex:0];
    }
    
    NSDictionary* dict = [_diagnoseItems objectAtIndex:indexPath.row];
	//    UIImage* greenBody = [UIImage imageNamed:@"green_body.png"];
	//    UIImage* bgImg =[greenBody stretchableImageWithLeftCapWidth:0 topCapHeight:0];
	//    cell.layer.contents = (id)bgImg.CGImage;
    [cell.icon setImage:[UIImage imageNamed:[dict objectForKey:@"icon"]]];
    [cell.title setText:[dict objectForKey:@"title"]];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


- (IBAction)diagnose:(id)sender
{
    
}

#pragma mark - Table view delegate

@end
