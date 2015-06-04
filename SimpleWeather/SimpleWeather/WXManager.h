//
//  WXManager.h
//  SimpleWeather
//
//  Created by MAC OS 10.9 on 15-5-27.
//  Copyright (c) 2015年 MAC OS 10.9. All rights reserved.
//

#import <Foundation/Foundation.h>
@import Foundation;
@import CoreLocation;
#import <ReactiveCocoa.h>

#import "WXCondition.h"

@interface WXManager : NSObject
<CLLocationManagerDelegate>

+ (instancetype)sharedManager;

@property (nonatomic, strong, readonly) CLLocation *currentLocation;
@property (nonatomic, strong, readonly) WXCondition *currentCondition;
@property (nonatomic, strong, readonly) NSArray *hourlyForecast;
@property (nonatomic, strong, readonly) NSArray *dailyForecast;

-(void) findCurrentLocation;

@end
