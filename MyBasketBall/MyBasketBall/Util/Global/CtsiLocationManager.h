//
//  CtsiLocationManager.h
//  mts-iphone
//
//  Created by doulala on 16/1/21.
//  Copyright © 2016年 中国电信. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

typedef NS_ENUM(NSInteger, CtsiLocationStatus) {
    // These statuses will accompany a valid location.
    /** Got a location and desired accuracy level was achieved successfully. */
    CtsiLocationStatusSuccess = 0,
    /** Got a location, but the desired accuracy level was not reached before timeout. (Not applicable to subscriptions.) */
    CtsiLocationStatusTimedOut,
    
    /** User has turned off location services device-wide (for all apps) from the system Settings app. */
    CtsiLocationStatusServicesDisabled,
    /** An error occurred while using the system location services. */
    CtsiLocationStatusError
};

@interface CtsiLocationManager :NSObject<CLLocationManagerDelegate>


typedef void(^CTSILocationRequestBlock)(CLLocation *currentLocation, CtsiLocationStatus status);


@property (nonatomic, copy) CTSILocationRequestBlock block;


- (instancetype)initWithDesiredAccuracy:(CLLocationAccuracy)desiredAccuracy
                                timeout:(NSTimeInterval)timeout
                                  block:(CTSILocationRequestBlock)block;


- (void)startLocation;
-(void)cancel;
@end
