//
//  AppDelegate.m
//  控制器的创建方式
//
//  Created by lw on 15/6/16.
//  Copyright © 2015年 lw. All rights reserved.
//

#import "AppDelegate.h"
#import "OneViewController.h"
#import "TowViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
/*
    代码创建控制器
 */
   self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor redColor];
//    
    OneViewController *one = [[OneViewController alloc]init];
   // one.view.backgroundColor =[UIColor blueColor];
    self.window.rootViewController = one;
//    
    [self.window makeKeyAndVisible];

//    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
//    
//    TowViewController *vc = [[TowViewController alloc]init];
//    vc.view.backgroundColor = [UIColor yellowColor];
//    self.window.rootViewController = vc;
//    
//    [self.window makeKeyAndVisible];
/*
    storyboard创建控制器
 */
//    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
//    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"vcGray"];
//    self.window.rootViewController = vc;
//    [self.window makeKeyAndVisible];
    
//    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Storyboard" bundle:[NSBundle mainBundle]];
//    UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"vcGray"];
//
//    self.window.rootViewController = vc;
//    [self.window makeKeyAndVisible];
    
   // NSLog(@"application didFinishLaunchingWithOptions");
    
    
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"applicationDidEnterBackground");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"applicationWillEnterForeground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"applicationDidBecomeActive");
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    NSLog(@"applicationWillTerminate");
}

@end
