//
//  LocationManager.h
//  CCLIOT
//
//  Created by Mac on 2016/12/28.
//  Copyright © 2016年 CCLL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface LocationManager : NSObject
+(LocationManager *)getInstance;
-(void)startUpdatingLocation:(UIApplication *)application;
+(void)updateMonitoredRegion:(NSString *)iuuid :(unsigned short)imajor :(unsigned short)iminor;

@end
