//
//  RegisterController.m
//  Achilles
//
//  Created by weiyanen on 13-5-10.
//  Copyright (c) 2013年 weiyanen. All rights reserved.
//

#import "LCBoundViewController.h"
#import "LTGlobalConfig.h"
#import "LCDataService.h"
#import "LCServiceDelegate.h"
#import "LCNetworkUtil.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "LCUtil.h"

@interface LCBoundViewController()
- (UILabel *)simepleLableWithFrame: (CGRect)frame andText:(NSString *)text;
- (UIImageView *)simpleImage:(NSString *)imageName withFrame:(CGRect)frame;
- (UIButton *)buttonWithImage:(NSString *)imageName withTag:(NSInteger)tag withFrame:(CGRect)frame withSelector:(SEL)selector;
- (void)getConfig;

@end


@implementation LCBoundViewController

const int pageNumber = 5;

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	
	self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
	self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * pageNumber, self.view.frame.size.height);
	self.scrollView.pagingEnabled = YES;
	self.scrollView.bounces = NO;
	self.scrollView.showsHorizontalScrollIndicator = NO;
	[self.view addSubview:self.scrollView];

	
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
	
	//add QRCode
	CGRect scanButtonRect = CGRectMake(self.view.frame.size.width, 200, 320, 44);
	[self.scrollView addSubview:[self buttonWithTitle:@"扫描二维码" withTag:0 withFrame:scanButtonRect withSelector:@selector(scan:)]];
	
	//
	CGRect textFieldRect = CGRectMake(self.view.frame.size.width, 250, 320, 44);
	self.qrTextField = [self simpleTextFieldWithFrame:textFieldRect withPlaceHolder:@"请扫描或手动输入OBD序列号"];
	[self.scrollView addSubview:self.qrTextField];
	
}

//按下Done按钮时调用这个方法，可让按钮消失
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	
    [textField resignFirstResponder];
    return YES;
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
		
		self.qrTextField.text = self.upcString;
    }
}

- (void)nextPage:(id)sender {
	UIButton *button = (UIButton *)sender;
	//button.tag = 1, 2, 3, ...
	if (button.tag < pageNumber) {
		if (button.tag == 1) {
			if ([LCNetworkUtil networkStatus] != G3_BIZ && [LCNetworkUtil networkStatus] != WIFI_BIZ) {
				UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"网络状态" message:@"网络失败。请确定使用WiFi或3G网络" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
				[alert show];
				return;
			}
		}
		if (button.tag == 2) {
			if (self.qrTextField.text.length == 0) {
				UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"OBD序列号为空" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
				[alert show];
				return;
			}
			NSURL *url = [NSURL URLWithString:@"http://58.210.101.202:59102/test/account/register"];
//			ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
			ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:url];
			//ua必填，千万不能少，否则没有responseString为nil
			[request addRequestHeader:@"ua" value:@"mapi 1.0 peseus 1.0.0 motorola MB525 Android 2.3.5"];
			
			[request setPostValue:self.qrTextField.text    forKey:@"obd"];
			[request setPostValue:self.qrTextField.text forKey:@"sid"];
			[request setPostValue:@"大众"    forKey:@"manufacturer"];
			[request setPostValue:@"奥迪"    forKey:@"brand"];
			[request setPostValue:@"A4"    forKey:@"model"];
			[request setPostValue:@"2.0T"    forKey:@"engine"];
			
			[request setDelegate:self];
			[request startAsynchronous];
		}
		
		if (button.tag != 2)
			[self.scrollView scrollRectToVisible:CGRectMake(self.view.frame.size.width * button.tag, 0, self.view.frame.size.width, self.view.frame.size.height) animated:NO];
//		if (button.tag == pageNumber - 2)
//			[self getConfig];
	} else {
		//finish
		[self getConfig];
		[self finish];
	}
}

#pragma mark - ASIHTTP Delegate

- (void)requestFinished:(ASIHTTPRequest *)request {
	//移动scrollview
	[self.scrollView scrollRectToVisible:CGRectMake(self.view.frame.size.width * 2, 0, self.view.frame.size.width, self.view.frame.size.height) animated:NO];
	[request setResponseEncoding:NSUTF8StringEncoding];
		
	// 当以文本形式读取返回内容时用这个方法
	
	NSString *responseString = [request responseString];
	NSLog(@"%@", responseString);
	// 当以二进制形式读取返回内容时用这个方法
	
	NSData *responseData = [request responseData];
	NSString *info = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
}

- (void)requestFailed:(ASIHTTPRequest *)request {
	NSError *error = [request error];
	[LCUtil simpleAlertViewWithTitle:@"系统信息" withMessage:@"初始化失败" delegate:self cancelButtonTitle:nil otherButtonTitles:@"确定"];
}

#pragma mark - TextField Delegate

- (UITextField *)simpleTextFieldWithFrame:(CGRect)frame withPlaceHolder:(NSString *)placeHolder {
	UITextField *textField = [[UITextField alloc] initWithFrame:frame];
	textField.placeholder = placeHolder;
	textField.borderStyle=UITextBorderStyleRoundedRect;
	//设置键盘完成按钮
	textField.returnKeyType=UIReturnKeyDone;
	textField.delegate=self;
	return textField;
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
