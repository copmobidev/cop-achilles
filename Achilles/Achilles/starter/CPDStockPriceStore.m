//
//  CPDStockPriceStore.m
//  CorePlotDemo
//
//  NB: Price data obtained from Yahoo! Finance:
//  http://finance.yahoo.com/q/hp?s=AAPL
//  http://finance.yahoo.com/q/hp?s=GOOG
//  http://finance.yahoo.com/q/hp?s=MSFT
//
//  Created by Steve Baranski on 5/4/12.
//  Copyright (c) 2012 komorka technology, llc. All rights reserved.
//

#import "CPDStockPriceStore.h"
#import "CPDConstants.h"

@interface CPDStockPriceStore ()


@end

@implementation CPDStockPriceStore

#pragma mark - Class methods

+ (CPDStockPriceStore *)sharedInstance
{
    static CPDStockPriceStore *sharedInstance;
    
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];      
    });
    
    return sharedInstance;
}

#pragma mark - API methods

- (NSArray *)tickerSymbols
{
    static NSArray *symbols = nil;
    if (!symbols)
    {
        symbols = [NSArray arrayWithObjects:
                   @"AAPL", 
                   @"GOOG", 
                   @"MSFT", 
                   nil];
    }
    return symbols;
}

- (NSArray *)dailyPortfolioPrices
{
    static NSArray *prices = nil;
    if (!prices)
    {
        prices = [NSArray arrayWithObjects:
                  [NSDecimalNumber numberWithFloat:182.13],
                  [NSDecimalNumber numberWithFloat:104.43],
                  [NSDecimalNumber numberWithFloat:132.01],
                  nil];
    }
    return prices;
}

- (NSArray *)datesInWeek
{
    static NSArray *dates = nil;
    if (!dates)
    {
        dates = [NSArray arrayWithObjects:
                 @"4/23", 
                 @"4/24", 
                 @"4/25",
                 @"4/26", 
                 @"4/27",                   
                 nil];
    }
    return dates;
}

- (NSArray *)weeklyPrices:(NSString *)tickerSymbol
{
    if ([CPDTickerSymbolSpeed isEqualToString:[tickerSymbol uppercaseString]] == YES)
    {
        return [self weeklySpeed];
    }
    else if ([CPDTickerSymbolOil isEqualToString:[tickerSymbol uppercaseString]] == YES)
    {
        return [self weeklyOil];
    }
    else if ([CPDTickerSymbolTime isEqualToString:[tickerSymbol uppercaseString]] == YES)
    {
        return [self weeklyTime];
    }
	else if ([LCConsumeAverageConsume isEqualToString:tickerSymbol] == YES) {
		return [self weeklyAverageConsume];
	}
	else if ([LCConsumeLeastConsume isEqualToString:tickerSymbol] == YES) {
		return [self weeklyLeastConsume];
	}
    return [NSArray array];
}

- (NSArray *)datesInMonth
{
    static NSArray *dates = nil;
    if (!dates)
    {
        dates = [NSArray arrayWithObjects:
                 @"2", 
                 @"3", 
                 @"4",
                 @"5",
                 @"9", 
                 @"10", 
                 @"11",
                 @"12", 
                 @"13",
                 @"16", 
                 @"17", 
                 @"18",
                 @"19", 
                 @"20", 
                 @"23", 
                 @"24", 
                 @"25",
                 @"26", 
                 @"27",
                 @"30",                   
                 nil];
    }
    return dates;
}

- (NSArray *)monthlyPrices:(NSString *)tickerSymbol
{
    if ([CPDTickerSymbolSpeed isEqualToString:[tickerSymbol uppercaseString]] == YES)
    {
        return [self monthlyAaplPrices];
    }
    else if ([CPDTickerSymbolOil isEqualToString:[tickerSymbol uppercaseString]] == YES)
    {
        return [self monthlyGoogPrices];
    }
    else if ([CPDTickerSymbolTime isEqualToString:[tickerSymbol uppercaseString]] == YES)
    {
        return [self monthlyMsftPrices];
    }
    return [NSArray array];
}

#pragma mark - Private behavior

- (NSArray *)weeklySpeed
{
    static NSArray *prices = nil;
    if (!prices)
    {
        prices = [NSArray arrayWithObjects:
                  [NSDecimalNumber numberWithFloat:171.70],
                  [NSDecimalNumber numberWithFloat:160.28],
                  [NSDecimalNumber numberWithFloat:110.00],
                  [NSDecimalNumber numberWithFloat:107.70],
                  [NSDecimalNumber numberWithFloat:103.00],
                  nil];
    }
    return prices;
}

- (NSArray *)weeklyOil
{
    static NSArray *prices = nil;
    if (!prices)
    {
        prices = [NSArray arrayWithObjects:
                  [NSDecimalNumber numberWithFloat:197.60],
                  [NSDecimalNumber numberWithFloat:101.27],
                  [NSDecimalNumber numberWithFloat:109.72],
                  [NSDecimalNumber numberWithFloat:115.47],
                  [NSDecimalNumber numberWithFloat:114.98],
                  nil];
    }
    return prices;
}

- (NSArray *)weeklyTime
{
    static NSArray *prices = nil;
    if (!prices)
    {
        prices = [NSArray arrayWithObjects:
                  [NSDecimalNumber numberWithFloat:132.12],
                  [NSDecimalNumber numberWithFloat:131.92],
                  [NSDecimalNumber numberWithFloat:132.20],
                  [NSDecimalNumber numberWithFloat:132.11],
                  [NSDecimalNumber numberWithFloat:131.98],
                  nil];
    }
    return prices;
}

- (NSArray *)weeklyAverageConsume
{
    static NSArray *prices = nil;
    if (!prices)
    {
        prices = [NSArray arrayWithObjects:
                  [NSDecimalNumber numberWithFloat:332.12],
                  [NSDecimalNumber numberWithFloat:131.92],
                  [NSDecimalNumber numberWithFloat:132.20],
                  [NSDecimalNumber numberWithFloat:132.11],
                  [NSDecimalNumber numberWithFloat:131.98],
                  nil];
    }
    return prices;
}

- (NSArray *)weeklyLeastConsume
{
    static NSArray *prices = nil;
    if (!prices)
    {
        prices = [NSArray arrayWithObjects:
                  [NSDecimalNumber numberWithFloat:197.60],
                  [NSDecimalNumber numberWithFloat:101.27],
                  [NSDecimalNumber numberWithFloat:109.72],
                  [NSDecimalNumber numberWithFloat:115.47],
                  [NSDecimalNumber numberWithFloat:114.98],
                  nil];
    }
    return prices;
}

- (NSArray *)monthlyAaplPrices
{
    static NSArray *prices = nil;
    if (!prices)
    {
        prices = [NSArray arrayWithObjects:
                  [NSDecimalNumber numberWithFloat:118.63],
                  [NSDecimalNumber numberWithFloat:129.32],
                  [NSDecimalNumber numberWithFloat:124.31],
                  [NSDecimalNumber numberWithFloat:133.68],
                  [NSDecimalNumber numberWithFloat:136.23],
                  [NSDecimalNumber numberWithFloat:128.44],
                  [NSDecimalNumber numberWithFloat:126.20],
                  [NSDecimalNumber numberWithFloat:122.77],
                  [NSDecimalNumber numberWithFloat:105.23],
                  [NSDecimalNumber numberWithFloat:180.13],
                  [NSDecimalNumber numberWithFloat:109.70],
                  [NSDecimalNumber numberWithFloat:108.34], 
                  [NSDecimalNumber numberWithFloat:187.44],
                  [NSDecimalNumber numberWithFloat:172.98],
                  [NSDecimalNumber numberWithFloat:171.70],
                  [NSDecimalNumber numberWithFloat:160.28],
                  [NSDecimalNumber numberWithFloat:110.00],
                  [NSDecimalNumber numberWithFloat:107.70],
                  [NSDecimalNumber numberWithFloat:103.00],
                  [NSDecimalNumber numberWithFloat:183.98],
                  nil];
    }
    return prices;
}

- (NSArray *)monthlyGoogPrices
{
    static NSArray *prices = nil;
    if (!prices)
    {
        prices = [NSArray arrayWithObjects:
                  [NSDecimalNumber numberWithFloat:146.92],
                  [NSDecimalNumber numberWithFloat:142.62],
                  [NSDecimalNumber numberWithFloat:135.15],
                  [NSDecimalNumber numberWithFloat:132.32],
                  [NSDecimalNumber numberWithFloat:130.84],
                  [NSDecimalNumber numberWithFloat:126.86],
                  [NSDecimalNumber numberWithFloat:135.96],
                  [NSDecimalNumber numberWithFloat:151.01],
                  [NSDecimalNumber numberWithFloat:124.60],
                  [NSDecimalNumber numberWithFloat:106.07],
                  [NSDecimalNumber numberWithFloat:109.57],
                  [NSDecimalNumber numberWithFloat:107.45],
                  [NSDecimalNumber numberWithFloat:199.30],
                  [NSDecimalNumber numberWithFloat:196.06],
                  [NSDecimalNumber numberWithFloat:197.60],
                  [NSDecimalNumber numberWithFloat:101.27],
                  [NSDecimalNumber numberWithFloat:109.72],
                  [NSDecimalNumber numberWithFloat:115.47],
                  [NSDecimalNumber numberWithFloat:114.98],
                  [NSDecimalNumber numberWithFloat:104.85],
                  nil];
    }
    return prices;
}

- (NSArray *)monthlyMsftPrices
{
    static NSArray *prices = nil;
    if (!prices)
    {
        prices = [NSArray arrayWithObjects:
                  [NSDecimalNumber numberWithFloat:132.29],
                  [NSDecimalNumber numberWithFloat:131.94],
                  [NSDecimalNumber numberWithFloat:131.21],
                  [NSDecimalNumber numberWithFloat:131.52],
                  [NSDecimalNumber numberWithFloat:131.10],
                  [NSDecimalNumber numberWithFloat:130.47],
                  [NSDecimalNumber numberWithFloat:130.35],
                  [NSDecimalNumber numberWithFloat:130.98],
                  [NSDecimalNumber numberWithFloat:130.81],
                  [NSDecimalNumber numberWithFloat:131.08],
                  [NSDecimalNumber numberWithFloat:131.44],
                  [NSDecimalNumber numberWithFloat:131.14],
                  [NSDecimalNumber numberWithFloat:131.01],
                  [NSDecimalNumber numberWithFloat:132.42],
                  [NSDecimalNumber numberWithFloat:132.12],
                  [NSDecimalNumber numberWithFloat:121.92],
                  [NSDecimalNumber numberWithFloat:132.20],
                  [NSDecimalNumber numberWithFloat:132.11],
                  [NSDecimalNumber numberWithFloat:131.98],
                  [NSDecimalNumber numberWithFloat:132.02],
                  nil];
    }
    return prices;
}


@end
