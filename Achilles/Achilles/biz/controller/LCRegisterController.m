//
//  RegisterController.m
//  Achilles
//
//  Created by weiyanen on 13-5-10.
//  Copyright (c) 2013年 weiyanen. All rights reserved.
//

#import "LCRegisterController.h"
#import "LTGlobalConfig.h"
#import "LCDataService.h"
#import "LCServiceDelegate.h"

@interface LCRegisterController()

- (UILabel *)simepleLableWithFrame: (CGRect)frame andText:(NSString *)text;
- (UIButton *)simepleButtonWithFrame:(CGRect)frame andText:(NSString *)text;
- (UIImageView *)simpleImage:(NSString *)imageName WithFrame:(CGRect)frame;
- (void)getConfig;
@end


@implementation LCRegisterController

const int pageNumber = 5;

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	
	self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
	self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * pageNumber, self.view.frame.size.height);
	self.scrollView.pagingEnabled = YES;
	self.scrollView.bounces = NO;
	self.scrollView.showsHorizontalScrollIndicator = NO;

	
	for (int i = 0; i < pageNumber; i++) {
		[self.scrollView addSubview:[self simpleImage:[NSString stringWithFormat:@"%d_bg.png", i+1] WithFrame:CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, self.view.frame.size.height)]];
//		[self.scrollView addSubview:[self simepleLableWithFrame:CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, 44) andText:[pageArray objectAtIndex:i]]];
		if (i == pageNumber - 1) {
			[self.scrollView addSubview:[self simepleButtonWithFrame:CGRectMake(self.view.frame.size.width * i, 420, self.view.frame.size.width, 44) andText:@"开始初始化"]];
		}
	}
	
	[self.view addSubview:self.scrollView];
}


- (UIImageView *)simpleImage:(NSString *)imageName WithFrame:(CGRect)frame {
	UIImageView * imageView = [[UIImageView alloc] initWithFrame:frame];
	imageView.image = [UIImage imageNamed:imageName];
	return imageView;
}

- (UILabel *)simepleLableWithFrame:(CGRect)frame andText:(NSString *)text {
	UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.font = [UIFont boldSystemFontOfSize:28.];
    label.textAlignment = NSTextAlignmentCenter;
    
    return label;
}

- (UIButton *)simepleButtonWithFrame:(CGRect)frame andText:(NSString *)text {
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = frame;
	[button  setTitle:text forState:UIControlStateNormal];
	[button addTarget:self action:@selector(getConfig) forControlEvents:UIControlEventTouchUpInside];
	return button;
}

- (void)getConfig {
	if (![LCDataService sharedDataService].delegate) {
		[[LCDataService sharedDataService] setDelegate:[LCServiceDelegate sharedInstance]];
		[[LCServiceDelegate sharedInstance] setRegisterController:self];
	}
	[[LCDataService sharedDataService] obdConfig];
}


- (void)dismiss {
	[self dismissModalViewControllerAnimated:YES];
}
@end
