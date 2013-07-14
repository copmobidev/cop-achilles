//
//  RegisterController.h
//  Achilles
//
//  Created by weiyanen on 13-5-10.
//  Copyright (c) 2013年 weiyanen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface LCRegisterController : UIViewController<ZBarReaderDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) ZBarReaderViewController *reader;

@property (nonatomic, strong) NSString *upcString;

- (void)finish;
@end
