//
//  AppDelegate.m
//  LCMINDemo
//
//  Created by Deirman on 2018/5/23.
//  Copyright © 2018年 Deirman. All rights reserved.
//

#import "AppDelegate.h"



@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//    [[NIMSDK sharedSDK].chatManager addDelegate:self];
//    //推荐在程序启动的时候初始化 NIMSDK
//    NSString *appKey        = @"2e5258c972677f9a95731118e3835647";
//    NIMSDKOption *option    = [NIMSDKOption optionWithAppKey:appKey];
//    option.apnsCername      = nil;
//    option.pkCername        = nil;
//    [[NIMSDK sharedSDK] registerWithOption:option];
//
//
//    NSString *account = @"test_1";
//    NSString *token   = @"3404a82139c160db85362646af9a826f";
//    [[NIMSDK sharedSDK].loginManager addDelegate:self];
//    [[[NIMSDK sharedSDK] loginManager] login:account
//                                       token:token
//                                  completion:^(NSError *error) {
//
//                                      NSLog(@"错误%@",error);
//
//                                  }];


    // Override point for customization after application launch.
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
