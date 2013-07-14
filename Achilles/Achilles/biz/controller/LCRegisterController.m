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
- (UIImageView *)simpleImage:(NSString *)imageName withFrame:(CGRect)frame;
- (UIButton *)buttonWithImage:(NSString *)imageName withTag:(NSInteger)tag withFrame:(CGRect)frame withSelector:(SEL)selector;
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

	
	for (int index = 0; index < pageNumber; index++) {
		//scroll subview
		[self.scrollView addSubview:[self simpleImage:[NSString stringWithFormat:@"%d_bg.png", index+1] withFrame:CGRectMake(self.view.frame.size.width * index, 0, self.view.frame.size.width, self.view.frame.size.height)]];
		
		//button & selector
		CGRect rect = CGRectZero;
		NSString *imageName = nil;
		if (index == 0) {
			imageName = @"start.png";
			rect = CGRectMake(self.view.frame.size.width * index, 400, self.view.frame.size.width, 44);
		} else {
			rect = CGRectMake(self.view.frame.size.width * index + 160, 400, self.view.frame.size.width/2, 44);
			if (index < pageNumber -1)
				imageName = @"nextStep.png";
			else
				imageName = @"finish.png";
		}
		
		[self.scrollView addSubview:[self buttonWithImage:imageName withTag:index + 1 withFrame:rect withSelector:@selector(nextPage:)]];
	}
	
	CGRect rect = CGRectMake(0, 350, 320, 44);
	[self.scrollView addSubview:[self buttonWithTitle:@"Scan" withTag:0 withFrame:rect withSelector:@selector(scan:)]];
	[self.view addSubview:self.scrollView];
}

- (void)scan:(id)sender {
	self.reader = [ZBarReaderViewController new];
	self.reader.readerDelegate = self;
	
    [self.reader.scanner setSymbology: ZBAR_UPCA config: ZBAR_CFG_ENABLE to: 0];
    self.reader.readerView.zoom = 1.0;
	
    [self presentModalViewController: self.reader
                            animated: YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	id<NSFastEnumeration> results = [info objectForKey: ZBarReaderControllerResults];
	
    ZBarSymbol *symbol = nil;
	
    for(symbol in results){
		
        self.upcString = symbol.data;
		
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Scanned UPC" message:[NSString stringWithFormat:@"The UPC read was: %@", self.upcString] delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
		
        [alert show];
		
		[self.reader dismissViewControllerAnimated:YES completion:nil];
		
    }
}

- (void)nextPage:(id)sender {
	UIButton *button = (UIButton *)sender;
	if (button.tag < pageNumber) {
		[self.scrollView scrollRectToVisible:CGRectMake(self.view.frame.size.width * button.tag, 0, self.view.frame.size.width, self.view.frame.size.height) animated:NO];
//		if (button.tag == pageNumber - 2)
//			[self getConfig];
	} else {
		//finish
		[self getConfig];
		[self finish];
	}
}
											 
- (UIImageView *)simpleImage:(NSString *)imageName withFrame:(CGRect)frame {
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

- (UIButton *)buttonWithImage:(NSString *)imageName withTag:(NSInteger)tag withFrame:(CGRect)frame withSelector:(SEL)selector {
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	button.frame = frame;
	
	[button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
	button.tag = tag;
	[button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
	return button;
}

- (UIButton *)buttonWithTitle:(NSString *)title withTag:(NSInteger)tag withFrame:(CGRect)frame withSelector:(SEL)selector {
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = frame;
	[button setTitle:title forState:UIControlStateNormal];
	button.tag = tag;
	[button addTarget:self action:selector forControlEvents:UIControlEventTouchUpInside];
	return button;
}

- (void)getConfig {
	if (![LCDataService sharedDataService].delegate) {
		[[LCDataService sharedDataService] setDelegate:[LCServiceDelegate sharedInstance]];
		[[LCServiceDelegate sharedInstance] setRegisterController:self];
	}
	[[LCDataService sharedDataService] obdConfig];
}


- (void)finish {
	[self dismissViewControllerAnimated:YES completion:nil];
}
@end
