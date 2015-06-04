//
//  WXCondition.m
//  SimpleWeather
//
//  Created by MAC OS 10.9 on 15-5-27.
//  Copyright (c) 2015年 MAC OS 10.9. All rights reserved.
//

#import "WXCondition.h"

@implementation WXWeather

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"conditionDescription": @"description",
             @"condition": @"main",
             @"icon": @"icon",
             };
}
@end

@implementation WXCondition

+ (NSDictionary *)imageMap{
    
    static NSDictionary *_imageMap = nil;
    if (!_imageMap){
        
        _imageMap = @{
                      @"01d" : @"weather-clear",
                      @"02d" : @"weather-few",
                      @"03d" : @"weather-few",
                      @"04d" : @"weather-broken",
                      @"09d" : @"weather-shower",
                      @"10d" : @"weather-rain",
                      @"11d" : @"weather-tstorm",
                      @"13d" : @"weather-snow",
                      @"50d" : @"weather-mist",
                      @"01n" : @"weather-moon",
                      @"02n" : @"weather-few-night",
                      @"03n" : @"weather-few-night",
                      @"04n" : @"weather-broken",
                      @"09n" : @"weather-shower",
                      @"10n" : @"weather-rain-night",
                      @"11n" : @"weather-tstorm",
                      @"13n" : @"weather-snow",
                      @"50n" : @"weather-mist",
                      };
    }
    return _imageMap;
}

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{
             @"date": @"dt",
             @"locationName": @"name",
             @"humidity": @"main.humidity",
             @"temperature": @"main.temp",
             @"tempHigh": @"main.temp_max",
             @"tempLow": @"main.temp_min",
             @"sunrise": @"sys.sunrise",
             @"sunset": @"sys.sunset",
             @"weather": @"weather",
             @"windBearing": @"wind.deg",
             @"windSpeed": @"wind.speed"
             };
}


+ (NSValueTransformer *)tempHighJSONTransformer{
    
    return [MTLValueTransformer transformerUsingForwardBlock:^(NSString *str, BOOL *success, NSError **error){
        return [NSString stringWithFormat:@"%f",(str.floatValue-32)/1.8];
        
    }];
}


+ (NSValueTransformer *)tempLowJSONTransformer{
    
    return [MTLValueTransformer transformerUsingForwardBlock:^(NSString *str, BOOL *success, NSError **error){
        return [NSString stringWithFormat:@"%f",(str.floatValue-32)/1.8];
        
    }];
}

+ (NSValueTransformer *)temperatureJSONTransformer{
    
    return [MTLValueTransformer transformerUsingForwardBlock:^(NSString *str, BOOL *success, NSError **error){
        return [NSString stringWithFormat:@"%f",(str.floatValue-32)/1.8];
   
    }];
}


+ (NSValueTransformer *)dateJSONTransformer{
    
    return [MTLValueTransformer transformerUsingForwardBlock:^(NSString *str, BOOL *success, NSError **error){
        return [NSDate dateWithTimeIntervalSince1970:str.floatValue];
    } reverseBlock:^(NSDate *date, BOOL *success, NSError **error){
        return [NSString stringWithFormat:@"%f", [date timeIntervalSince1970]];
    }];
}

+ (NSValueTransformer *)sunriseJSONTransformer{
    return [self dateJSONTransformer];
}

+ (NSValueTransformer *)sunsetJSONTransformer{
    return [self dateJSONTransformer];
}

+ (NSValueTransformer *)weatherJSONTransformer{
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:WXWeather.class];
}

/*
+ (NSValueTransformer *)conditionDescriptionJSONTransformer{
    
    return [MTLValueTransformer transformerUsingForwardBlock:^(NSArray *values, BOOL *success, NSError **error){
        NSLog(@"firstObject:%@", [values firstObject]);
        return [values firstObject];
    } reverseBlock:^(NSString *str,BOOL *success, NSError **error){
        return @[str];
    }];
}

+ (NSValueTransformer *)conditionJSONTransformer{
    return [self conditionDescriptionJSONTransformer];
}

+ (NSValueTransformer *)iconJSONTransformer{
    return [self conditionDescriptionJSONTransformer];
}*/

#define MPS_TO_MPH 2.23694f


+ (NSValueTransformer *)windSpeedJSONTransformer{
    
    return [MTLValueTransformer transformerUsingForwardBlock:^(NSNumber *num, BOOL *success, NSError **error){
        return @(num.floatValue*MPS_TO_MPH);
    } reverseBlock:^(NSNumber *speed, BOOL *success, NSError **error){
        return @(speed.floatValue/MPS_TO_MPH);
    }];
}

- (NSString *)imageName{
    return [WXCondition imageMap][((WXWeather *)[[self weather] objectAtIndex:0]).icon];
}

@end
