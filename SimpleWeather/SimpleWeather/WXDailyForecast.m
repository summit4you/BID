//
//  WXDailyForecast.m
//  SimpleWeather
//
//  Created by MAC OS 10.9 on 15-5-27.
//  Copyright (c) 2015年 MAC OS 10.9. All rights reserved.
//

#import "WXDailyForecast.h"

@implementation WXDailyForecast

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    
    NSMutableDictionary *paths=[[super JSONKeyPathsByPropertyKey] mutableCopy];
    paths[@"tempHigh"] = @"temp.max";
    paths[@"tempLow"] = @"temp.min";
    return paths;
}

@end
