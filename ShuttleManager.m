//
//  ShuttleManager.m
//  HoldOA
//
//  Created by admin on 16/10/8.
//  Copyright © 2016年 admin. All rights reserved.
//

#import "ShuttleManager.h"

@implementation ShuttleManager

- (ShuttleManager *)initWithName:(NSString *)shuttleTime       shuttleNumber:(NSString *)shuttleNumber
                shuttleTelephone:(NSString *)shuttleTelephone  shuttleRoute:(NSString *)shuttleRoute
                     shuttleSite:(NSString *)shuttleSite       shuttleType:(NSString *)shuttleType
               shuttleDepartment:(NSString *)shuttleDepartment shuttleWay:(NSString *)shuttleWay {
    if (self = [super init]) {
        self.shuttleTime = shuttleTime;
        self.shuttleNumber = shuttleNumber;
        self.shuttleTelephone = shuttleTelephone;
        self.shuttleRoute = shuttleRoute;
        self.shuttleSite = shuttleSite;
        self.shuttleType = shuttleType;
        self.shuttleDepartment = shuttleDepartment;
        self.shuttleWay = shuttleWay;
    }
    return self;
}

@end