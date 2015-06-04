//
//  WXClient.h
//  SimpleWeather
//
//  Created by MAC OS 10.9 on 15-5-27.
//  Copyright (c) 2015年 MAC OS 10.9. All rights reserved.
//

#import <Foundation/Foundation.h>
@import CoreLocation;
#import <ReactiveCocoa.h>
@import Foundation;

@interface WXClient : NSObject

- (RACSignal *) fetchJSONFromURL:(NSURL *)url;
- (RACSignal *) fetchCurrentConditionsForLocation:(CLLocationCoordinate2D)coordinate;
- (RACSignal *) fetchHourlyForecastForLocation:(CLLocationCoordinate2D)coordinate;
- (RACSignal *) fetchDailyForecastForLocation:(CLLocationCoordinate2D)coordinate;

@end
