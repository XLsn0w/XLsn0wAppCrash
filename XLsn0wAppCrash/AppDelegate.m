//
//  AppDelegate.m
//  XLsn0wAppCrash
//
//  Created by XLsn0w on 2018/6/2.
//  Copyright © 2018年 XLsn0w. All rights reserved.
//

#import "AppDelegate.h"
#import "DSSignalHandler.h"
#import "DSSafeFree.h"
#import "RootViewController.h"

@interface AppDelegate ()

@end

//写入了一些导致崩溃的代码。
//1. 提高了野指针的崩溃率。可以帮你很快找到一些隐藏的不易崩溃的错误代码。
//2. 加入信号量的崩溃。SIGSEGV、SIGBUS、SIGABRT
//3. 内存泄露模拟。

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    //启动异常处理
    InstallSignalHandler();//信号量截断
    InstallUncaughtExceptionHandler();//系统异常捕获
    
#if DEBUG
    init_safe_free();
#endif

    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    

    self.window.rootViewController =  [[UINavigationController alloc] initWithRootViewController:[RootViewController new]];
    
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
