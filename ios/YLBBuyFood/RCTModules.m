//
//  RCTModules.m
//  YLBBuyFood
//
//  Created by yulibo on 2020/5/4.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "RCTModules.h"
#import "RCTBridge.h"

@implementation RCTModules

RCT_EXPORT_MODULE(RCTModules)
//RN跳转原生界面
RCT_EXPORT_METHOD(RNOpenOneVC:(NSString *)msg){
    
    NSLog(@"RN传入原生界面的数据为:%@",msg);
    //主要这里必须使用主线程发送,不然有可能失效
    dispatch_async(dispatch_get_main_queue(), ^{
        NSDictionary *userInfo = @{@"msg":msg?msg:@""};
        [[NSNotificationCenter defaultCenter] postNotificationName:@"RNOpenOneVC" object:userInfo];
    });
}

@end
