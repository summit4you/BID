//
//  WXCondition.h
//  SimpleWeather
//
//  Created by MAC OS 10.9 on 15-5-27.
//  Copyright (c) 2015年 MAC OS 10.9. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface WXWeather : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *conditionDescription;
@property (nonatomic, strong) NSString *condition;
@property (nonatomic, strong) NSString *icon;

@end


@interface WXCondition : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSData *date;
@property (nonatomic, strong) NSNumber *humidity;
@property (nonatomic, strong) NSNumber *temperature;
@property (nonatomic, strong) NSNumber *tempHigh;
@property (nonatomic, strong) NSNumber *tempLow;
@property (nonatomic, strong) NSString *locationName;
@property (nonatomic, strong) NSDate *sunrise;
@property (nonatomic, strong) NSDate *sunset;
@property (nonatomic, strong) NSArray *weather;
@property (nonatomic, strong) NSNumber *windBearing;
@property (nonatomic, strong) NSNumber *windSpeed;


- (NSString *)imageName;

@end
