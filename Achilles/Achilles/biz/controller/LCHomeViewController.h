//
//  FirstTopViewController.h
//  ECSlidingViewController
//
//  Created by Michael Enriquez on 1/23/12.
//  Copyright (c) 2012 EdgeCase. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "ECSlidingViewController.h"
#import "LCMenuViewController.h"
#import "UnderRightViewController.h"
#import "LCArcView.h"

@interface LCHomeViewController : UIViewController<CPTPieChartDataSource, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *pieData;

@property (nonatomic, strong) CPTXYGraph *graph;

@property (nonatomic, strong) CPTGraphHostingView *hostingView;

@property (nonatomic, strong) UIView *bowView;

@property (nonatomic, strong) LCArcView *arcView;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundView;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UIView *barView;

@property (nonatomic, strong) LCMenuViewController *menuViewController;

- (IBAction)arrowLeft:(id)sender;

- (IBAction)arrowRight:(id)sender;


- (IBAction)revealMenu:(id)sender;

- (IBAction)revealUnderRight:(id)sender;

- (IBAction)functionButtonClicked:(id)sender;



@end
