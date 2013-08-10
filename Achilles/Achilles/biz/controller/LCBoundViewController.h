//
//  LCBoundViewController.h
//  Achilles
//
//  Created by weiyanen on 13-5-10.
//  Copyright (c) 2013年 weiyanen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"
#import "ASIHTTPRequest.h"
@interface LCBoundViewController : UIViewController<ZBarReaderDelegate, UITextFieldDelegate, ASIHTTPRequestDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) ZBarReaderViewController *reader;

@property (nonatomic, strong) NSString *qrString;

@property (nonatomic, strong) UITextField *qrTextField;

- (void)finish;
@end
