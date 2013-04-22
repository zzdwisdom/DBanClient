//
//  zzdAppDelegate.m
//  DBanClient
//
//  Created by ibokan on 13-4-15.
//  Copyright (c) 2013年 ibokan. All rights reserved.
//

#import "zzdAppDelegate.h"
#import "moviesViewController.h"
#import "musicViewController.h"
#import "activeViewController.h"
#import "aboutViewController.h"
@implementation zzdAppDelegate

- (void)dealloc
{
    [_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor grayColor];
    
    // -------- navigation #1 ----------
    // 创建第一个界面
   moviesViewController *movie = [[moviesViewController alloc] init];
    
    // 创建UINavigationController实例
    UINavigationController *navigation1 = [[UINavigationController alloc] initWithRootViewController:movie];
//    navigation1.navigationBar.backgroundColor = [UIColor blackColor];
    navigation1.navigationBar.tintColor = [UIColor blackColor];
    navigation1.title = @"豆瓣电影";
    
    [movie release];
    
    // 设置navigation #1的tab bar item
    navigation1.tabBarItem.image = [UIImage imageNamed:@"about.png"];
    navigation1.tabBarItem.title = @"Movies";
   
    
    // -------- navigation #2 ----------
    // 创建第一个界面
    musicViewController *music = [[musicViewController alloc] initWithStyle:UITableViewStylePlain];
    
    // 创建UINavigationController实例
    UINavigationController *navigation2 = [[UINavigationController alloc] initWithRootViewController:music];
    [music release];
    
    // 设置navigation #2的tab bar item
    navigation2.tabBarItem.image = [UIImage imageNamed:@"about.png"];
    navigation2.tabBarItem.title = @"Music";
    
    //--------navagation #3-----------
    //创建第一个界面
    activeViewController *active = [[activeViewController alloc]initWithStyle:UITableViewStylePlain];
    //创建navagationcontriller实例
    UINavigationController *navigation3 = [[UINavigationController alloc] initWithRootViewController:active];
    [active release];
    //设置navigation3的tabbaritem
    navigation3.tabBarItem.image = [UIImage imageNamed:@"about.png"];
    navigation3.tabBarItem.title = @"Active";
    
    // -------- navigation #4 ----------
    // 创建第一个界面
    aboutViewController *about = [[aboutViewController alloc] init];
    
    // 创建UINavigationController实例
    UINavigationController *navigation4 = [[UINavigationController alloc] initWithRootViewController:about];
    [about release];
    
    // 设置navigation #3的tab bar item
    navigation4.tabBarItem.title = @"About";
    navigation4.tabBarItem.image = [UIImage imageNamed:@"about.png"];
    
    // 创建UITabBarController实例
    UITabBarController *tab = [[UITabBarController alloc] init];
    tab.viewControllers = [NSArray arrayWithObjects:navigation1, navigation2,navigation3, navigation4, nil];
    
    self.window.rootViewController = tab;
    [tab release];
    
    [navigation1 release];
    [navigation2 release];
    [navigation3 release];
    [navigation4 release];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
