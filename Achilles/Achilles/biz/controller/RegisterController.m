//
//  RegisterController.m
//  Achilles
//
//  Created by weiyanen on 13-5-10.
//  Copyright (c) 2013年 weiyanen. All rights reserved.
//

#import "RegisterController.h"
#import "WelcomeScrollView.h"

@interface RegisterController()

- (UILabel *)simepleLableWithFrame: (CGRect)frame andText:(NSString *)text;
- (UIButton *)simepleButtonWithFrame:(CGRect)frame andText:(NSString *)text;

@end

@implementation RegisterController

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
	[button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
	return button;
}

- (void)dismiss {
	[self dismissModalViewControllerAnimated:YES];
}
@end
