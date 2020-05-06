//
//  ViewController.m
//  YLBBuyFood
//
//  Created by yulibo on 2020/5/4.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "ViewController.h"
#import <React/RCTRootView.h>
#import "AppDelegate.h"
#import "SecondViewController.h"
#import "NSObject+XKController.h"
#import <React/RCTBundleURLProvider.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    
    UIButton *scoreButton = [[UIButton alloc] init];
    scoreButton.frame = CGRectMake(0, 0, 100, 50);
    
    scoreButton.center = CGPointMake(CGRectGetWidth(self.view.frame)/2.0, CGRectGetHeight(self.view.frame)/2.0);
    [scoreButton setTitle:@"得分" forState:UIControlStateNormal];
    [scoreButton setTitleColor:UIColor.cyanColor forState:UIControlStateNormal];
    [scoreButton addTarget:self action:@selector(highScoreButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scoreButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doPushNotification:) name:@"RNOpenOneVC" object:nil];
}

- (IBAction)highScoreButtonPressed:(id)sender {
    NSLog(@"High Score Button Pressed");
    NSURL *jsCodeLocation;
#ifdef DEBUG
    jsCodeLocation = [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
#else
    //离线包
    jsCodeLocation = [[NSBundle mainBundle] URLForResource:@"bundle/index.ios" withExtension:@"jsbundle"];
#endif
//    jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];
//    172.20.10.4

    
//    jsCodeLocation = [NSURL URLWithString:@"http://172.20.10.4:8081/index.bundle?platform=ios"];
    
    RCTRootView *rootView =
      [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                  moduleName: @"RNHighScores"
                           initialProperties:
                             @{
                               @"scores" : @[
                                 @{
                                   @"name" : @"Alex",
                                   @"value": @"52"
                                  },
                                 @{
                                   @"name" : @"Joel",
                                   @"value": @"10"
                                 }
                               ]
                             }
                               launchOptions: nil];
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view = rootView;
    
//    vc.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self presentViewController:vc animated:YES completion:nil];
    
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)doPushNotification:(NSNotification *)notification{
    NSLog(@"成功收到===>通知：%@",notification.object);
//    SecondViewController *one = [[SecondViewController alloc]init];
//    
//    AppDelegate *app = (AppDelegate *)[[UIApplication sharedApplication] delegate];
//    
//    [app.nav pushViewController:one animated:YES];
    
    [self.getCurrentUIVC.navigationController popViewControllerAnimated:YES];
//    [self.getCurrentUIVC dismissViewControllerAnimated:YES completion:^{
//
//    }];
    
    //注意不能在这里移除通知否则pus进去后有pop失效
}

@end
