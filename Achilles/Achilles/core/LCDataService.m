//
//  LCDataService.m
//  Peleus
//
//  Created by ChrisLiu  on 5/2/13.
//  Copyright (c) 2013 cop-studio. All rights reserved.
//

#import "LCDataService.h"
#import "LCTimestamp.h"

@implementation LCDataService

static LCDataService *sharedDataService = nil;

+ (LCDataService *)sharedDataService
{
	@synchronized(self)
    {
		if (sharedDataService == nil)
        {
			sharedDataService = [[LCDataService alloc] init];
		}
	}
	return sharedDataService;
}

- (void)getConfigWithSuccessBlock:(void (^)(NSDictionary *))success
                    withFailBlock:(void (^)())fail
{
//	fail();
	success(@{@"obd":@"xxxx", @"sid":@"xx11", @"indicator":@0});
}

// 获取一年数据统计时，按月划分数据，展现数据包括
// 1.每月、日刹车、加速等驾驶行为统计
// 2.每月、日平均/最佳油耗统计
// 3.每月、日平均速度统计
// 4.每月、日最佳温度统计
- (NSDictionary* )getDrivingDataWithSpan:(LCTimestamp* )timestamp
{    
    switch ([timestamp span]) {
        case YEAR:
            break;
        case MONTH:
            break;
        case WEEK:
            break;
        case TRACK:
            break;
        default:
            break;
    }
    return nil;
}

//
// 解析原始数据
// 获取一次行程数据，包含两种数据
// 1.单次行程summary数据
// 2.单次行程分析后取得的各个时间片上的统计数据，主要包括各个时间点上的平均油耗、
//
- (NSDictionary* )parseOriginData:(NSString* )originData
{
    return nil;
}

@end