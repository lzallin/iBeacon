//
//  AppDelegate.m
//  蓝牙相关-ibeacon
//
//  Created by Mac on 2017/5/5.
//  Copyright © 2017年 lz. All rights reserved.
//

#import "AppDelegate.h"
#import "LocationManager.h"
@import CoreLocation;

@interface AppDelegate ()<UIApplicationDelegate,CLLocationManagerDelegate>
@property CLLocationManager *locationManager;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //iBeacan 相关
    LocationManager *manager=[LocationManager getInstance];//设置成单例类
    [manager startUpdatingLocation:application];//设置代理 开启监控
    [LocationManager updateMonitoredRegion:@"硬件工程师给你的UUID" :0 :0];//major minor 给0则监控所有UUID为硬件工程师给你的UUID的信标
    
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
