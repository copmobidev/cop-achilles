//
//  RegisterController.m
//  Achilles
//
//  Created by weiyanen on 13-5-10.
//  Copyright (c) 2013年 weiyanen. All rights reserved.
//

#import "LCRegisterController.h"
#import "WelcomeScrollView.h"
#import "LTGlobalConfig.h"
//#import "Peleus/LCDataService.h"
#import "LCDataService.h"

@interface LCRegisterController()

- (UILabel *)simepleLableWithFrame: (CGRect)frame andText:(NSString *)text;
- (UIButton *)simepleButtonWithFrame:(CGRect)frame andText:(NSString *)text;
- (void)getConfig;
@end

@implementation LCRegisterController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	
	self.scrollView = [[WelcomeScrollView alloc] initWithFrame:self.view.bounds];
	self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 4, self.view.frame.size.height);
	self.scrollView.pagingEnabled = YES;
	
	NSArray *pageArray = @[@"Page1", @"Page2", @"Page3", @"Page4"];
	for (int i = 0; i < pageArray.count; i++) {
		[self.scrollView addSubview:[self simepleLableWithFrame:CGRectMake(self.view.frame.size.width * i, 0, self.view.frame.size.width, 44) andText:[pageArray objectAtIndex:i]]];
		if (i == pageArray.count - 1) {
			[self.scrollView addSubview:[self simepleButtonWithFrame:CGRectMake(self.view.frame.size.width * i, 50, self.view.frame.size.width, 44) andText:@"开始初始化"]];
		}
	}
	
	[self.view addSubview:self.scrollView];
}


- (UILabel *)simepleLableWithFrame: (CGRect)frame andText:(NSString *)text {
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
	
//	[[LCDataService sharedDataService] getConfigWithSuccessBlock:^(NSDictionary *configDictionary){
//		[[LCGlobalConfig sharedGlobalConfig] setConfigDictionary:configDictionary];
//		[self dismiss];
//	} withFailBlock:^(){
//		//alert
//		UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"初始化失败"
//													   message:@"请确认已连接车载OBD Wifi"
//													  delegate:nil
//											 cancelButtonTitle:@"ok"
//											 otherButtonTitles:nil];
//		[alert show];
//	}];
}


- (void)dismiss {
	[self dismissModalViewControllerAnimated:YES];
}
@end
