//
//  CalendarManager.m
//  YLBBuyFood
//
//  Created by yulibo on 2020/5/7.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "CalendarManager.h"
#import <React/RCTLog.h>
#import <React/RCTConvert.h>

@implementation CalendarManager
// To export a module named CalendarManager
RCT_EXPORT_MODULE();

// This would name the module AwesomeCalendarManager instead
// RCT_EXPORT_MODULE(AwesomeCalendarManager);

RCT_EXPORT_METHOD(addEvent:(NSString *)name location:(NSString *)location date:(NSDate *)date details:(NSDictionary *)details)
{
    NSString *dicLocation = [RCTConvert NSString:details[@"location"]];
    NSDate *time = [RCTConvert NSDate:details[@"time"]];
    
}

RCT_EXPORT_METHOD(findEvents:(RCTResponseSenderBlock)callback)
{
    NSArray *events = @[@"1"];
    static int i = 0;
    NSString *numStr = [NSString stringWithFormat:@"%d",i++];
    callback(@[[NSNull null], numStr]);
}

@end
