//
//  CtsiLocationManager.m
//  mts-iphone
//
//  Created by doulala on 16/1/21.
//  Copyright © 2016年 中国电信. All rights reserved.
//

#import "CtsiLocationManager.h"

@implementation CtsiLocationManager{

    CLLocationManager *_locationManager;
    NSTimeInterval _timeout;
    CLLocationAccuracy _desiredAccuracy;
    BOOL _locationAWhileChecked;
    BOOL _locating;
    CLLocation* _location;
}

static id _sharedInstance;


- (instancetype)initWithDesiredAccuracy:(CLLocationAccuracy)desiredAccuracy
                                timeout:(NSTimeInterval)timeout
                                  block:(CTSILocationRequestBlock)block
{
    self = [super init];
    _timeout=timeout;
    _desiredAccuracy=desiredAccuracy;
    self.block=block;
    
    if (self) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.delegate = self;
        if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)
        {
            [_locationManager requestAlwaysAuthorization];
        }
        
#ifdef __IPHONE_8_4
#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_4
        /* iOS 9 requires setting allowsBackgroundLocationUpdates to YES in order to receive background location updates.
         We only set it to YES if the location background mode is enabled for this app, as the documentation suggests it is a
         fatal programmer error otherwise. */
        NSArray *backgroundModes = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"UIBackgroundModes"];
        if ([backgroundModes containsObject:@"location"]) {
            if ([_locationManager respondsToSelector:@selector(setAllowsBackgroundLocationUpdates:)]) {
                [_locationManager setAllowsBackgroundLocationUpdates:YES];
            }
        }
#endif /* __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_8_4 */
#endif /* __IPHONE_8_4 */
    }
    return self;
}



- (void)startLocation{
    [self initParams];
    if ([CLLocationManager locationServicesEnabled] && ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusAuthorized || [CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined)) {
        _locationManager.desiredAccuracy = _desiredAccuracy;
        _locationManager.distanceFilter = 0.0f;
        [_locationManager startUpdatingLocation];
        [self startLocationTimeoutCheck];
        [self startLocationAWhileCheck];
        _locating=YES;
        
        NSLog(@"开始定位");
    }else{
        NSLog(@"定位不可用");
        [self serviceDisabled];
    }
}

-(void)initParams{
    _locationAWhileChecked=NO;
    _location=nil;
    _locating=NO;
}


-(void)stopUpdatingLocationWhileTimeout{
    NSLog(@"timeout");
    [self timeout];
}
-(void) startLocationTimeoutCheck{
    
    [self performSelector:@selector(stopUpdatingLocationWhileTimeout) withObject:nil afterDelay:_timeout];
}


-(void) cancelLocationChecks{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

-(void)startLocationAWhileCheck{

   [self performSelector:@selector(checkLocationAWhile) withObject:nil afterDelay:2];

}
-(void) checkLocationAWhile{
     NSLog(@"checkLocationAWhile");
    if(_location){
        [self success];
    }
    _locationAWhileChecked=YES;
}
//- (CTSILocationRequestBlock)block{
//    if (_block == nil) {
//        _block = ^(CLLocation *currentLocation, CtsiLocationStatus status){
//            
//        };
//    }
//    return _block;
//}

-(void)success{
    [self cancelLocationChecks];
    if(_locating&&self.block){
        
        self.block(_location,CtsiLocationStatusSuccess);
    }
    [_locationManager stopUpdatingLocation];
    _locating=NO;
}
-(void) error{
    [self cancelLocationChecks];
    [_locationManager stopUpdatingLocation];
    
    if(_locating&&self.block){
        
        self.block(nil,CtsiLocationStatusError);
    }
    _locating=NO;
}
-(void) timeout{
    [self cancelLocationChecks];
    if(_locationManager){
        [_locationManager stopUpdatingLocation];
    }
    if(_location){
        [self success];
    }else{
        if(_locating&&self.block){
            
            self.block(nil,CtsiLocationStatusTimedOut);
        }
        
    }
    _locating=NO;
}

-(void)serviceDisabled{
    [self cancelLocationChecks];
    if(self.block)
        self.block(nil,CtsiLocationStatusServicesDisabled);
    _locating=NO;
}
-(void)cancel{
    if(_locating){
        [_locationManager stopUpdatingLocation];
        [self cancelLocationChecks];
        _locating=NO;
    }
}

#pragma mark -
#pragma mark CLLocationManager Methods
- (void) locationManager: (CLLocationManager *) manager
     didUpdateToLocation: (CLLocation *) newLocation
            fromLocation: (CLLocation *) oldLocation
{
    _location=newLocation;
    if(_locationAWhileChecked){
        [self success];
    }
}
- (void) locationManager: (CLLocationManager *) manager
        didFailWithError: (NSError *) error {
    [self error];
}



@end
