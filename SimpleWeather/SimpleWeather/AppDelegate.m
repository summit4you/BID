//
//  AppDelegate.m
//  SimpleWeather
//
//  Created by MAC OS 10.9 on 15-5-26.
//  Copyright (c) 2015年 MAC OS 10.9. All rights reserved.
//

#import "AppDelegate.h"
#import <MobClick.h>
#import <ShareSDK/ShareSDK.h>
#import "WXApi.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // umeng setting
    [MobClick startWithAppkey:@"557161b367e58e23e10033e6" reportPolicy:BATCH channelId:@"fir.im"];
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBunleShortVersionString"];
    [MobClick setAppVersion:version];
    
    // share sdk
    [ShareSDK registerApp:@"80d1471cb1e8"];
    
    // wechat
    [ShareSDK connectWeChatWithAppId:@"wx081087830b2fd700" appSecret:@"3df40fca9f52f997c960c07efd5e4c41" wechatCls:[WXApi class]];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.rootViewController = [ [WXController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [TSMessage setDefaultViewController: self.window.rootViewController];
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [ShareSDK handleOpenURL:url wxDelegate:self];
}
- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation
{
    return [ShareSDK handleOpenURL:url sourceApplication:sourceApplication annotation:annotation wxDelegate:self];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
