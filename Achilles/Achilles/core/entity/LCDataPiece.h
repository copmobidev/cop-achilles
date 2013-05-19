//
//  LCDataPiece.h
//  Peleus
//
//  Created by ChrisLiu  on 5/2/13.
//  Copyright (c) 2013 cop-studio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LCDataService.h"

@interface LCDataPiece : NSObject
{
    int zeroTime;
    int lowTime;
    int midTime;
    int highTime;
    int overTime;
    int dist;
    int brake;
    int acc;
    double oilCost;
    double wTemp;
    int beginTime;
    int endTime;
}



@end
