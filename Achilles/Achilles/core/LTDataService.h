//
//  LTDataService.h
//  Peleus
//
//  Created by ChrisLiu  on 5/2/13.
//  Copyright (c) 2013 cop-studio. All rights reserved.
//

#import <Foundation/Foundation.h>





typedef enum {
    TRACK, // 单词行程,最小统计切片（default via min，当单次行程时间较长时适当合并行程）
    WEEK, // 周,最小统计切片为日
    MONTH, // 月,最小统计切片为日
    YEAR // 按年,最小统计切片为月
} Span; // 统计跨度


@interface LTDataService : NSObject
+ (LTDataService *)sharedLTDataService;

- (NSDictionary* )getActionsBy:(Span)span from:(long)beginTime to:(long)endTime;

- (NSDictionary* )getOilCostBy:(Span)span from:(long)beginTime to:(long)endTime;

- (NSDictionary* )getSpeedBy:(Span)span from:(long)beginTime to:(long)endTime;

- (NSDictionary* )getTempBy:(Span)span from:(long)beginTime to:(long)endTime;

- (void)getConfigWithSuccessBlock:(void (^)(NSDictionary *))success withFailBlock:(void (^)())fail;
@end
