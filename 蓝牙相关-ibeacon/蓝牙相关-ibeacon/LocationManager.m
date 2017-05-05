//
//  LocationManager.m
//  CCLIOT
//
//  Created by Mac on 2016/12/28.
//  Copyright © 2016年 CCLL. All rights reserved.
//

#import "LocationManager.h"
#import <AudioToolbox/AudioToolbox.h>
#import "AppDelegate.h"

@import CoreLocation;
@interface LocationManager ()<CLLocationManagerDelegate,UIApplicationDelegate>
@property (nonatomic ,strong) CLLocationManager *locationManager;
@end
@implementation LocationManager

-(CLLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager=[[CLLocationManager alloc] init];
    }
    return _locationManager;
}
+(LocationManager *)getInstance
{
    static LocationManager *manager=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager=[[LocationManager alloc] init];
    });
    return manager;
}
-(void)startUpdatingLocation:(UIApplication *)application
{
    self.locationManager.delegate = self;
    
    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationManager requestAlwaysAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    
}
#pragma mark-监控信标
+ (void)updateMonitoredRegion:(NSString *)iuuid :(unsigned short)imajor :(unsigned short)iminor
{
    CLBeaconRegion *region;
    
    NSString *str=[NSString stringWithFormat:@"%@%u%u",iuuid,imajor,iminor];
    
    NSUUID *uuid=[NSUUID new];
    region = nil;
    
    if(iuuid && imajor && iminor)
    {
        region = [[CLBeaconRegion alloc] initWithProximityUUID:[uuid initWithUUIDString:iuuid]  major:imajor minor:iminor identifier:str];
        
    }else if (iuuid) {
        
        region=[[CLBeaconRegion alloc] initWithProximityUUID:[uuid initWithUUIDString:iuuid] identifier:str];
    }
    if(region)
    {
        region.notifyOnEntry = YES;
        region.notifyOnExit = YES;
        [[LocationManager getInstance].locationManager startMonitoringForRegion:region];
        [[LocationManager getInstance].locationManager startRangingBeaconsInRegion:region];
    }
}
#pragma mark-进入或离开信标的回调
- (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region
{

}
#pragma mark-范围内的所有信标
- (void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region
{
   
}
@end
