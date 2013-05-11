//
//  LTNetworkUtil.m
//  Peleus
//
//  Created by ChrisLiu  on 5/11/13.
//  Copyright (c) 2013 cop-studio. All rights reserved.
//

#import "LTNetworkUtil.h"
#import "LTConfig.h"
#import "Reachability.h"

@implementation LTNetworkUtil

/**
 * 判断当前网络连接状况
 *
 */
+ (LTNetworkState)networkState
{
    Reachability *bizReach = [Reachability reachabilityWithHostName:COP_BIZ_SERVER];
    Reachability *obdReach = [Reachability reachabilityWithHostName:COP_OBD_SERVER];
    
    if ([bizReach currentReachabilityStatus] == NotReachable &&
        [obdReach currentReachabilityStatus] == NotReachable)
    {
        return NONE;
    }
    else if ([bizReach currentReachabilityStatus] == ReachableViaWWAN) {
        return G3_BIZ;
    }
    else if ([bizReach currentReachabilityStatus] == ReachableViaWiFi) {
        return WIFI_BIZ;
    }
    else if ([obdReach currentReachabilityStatus] == ReachableViaWiFi) {
        return WIFI_OBD;
    }
    return NONE;
}

@end
