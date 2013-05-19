//
//  LCDataService.h
//  Peleus
//
//  Created by ChrisLiu  on 5/2/13.
//  Copyright (c) 2013 cop-studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCDataServiceDelegate.h"

@class LCTimestamp;


@interface LCDataService : NSObject <LCDataServiceDelegate>

+ (LCDataService *)sharedDataService;

- (NSDictionary* )parseOriginData:(NSString* )originData;

@end
