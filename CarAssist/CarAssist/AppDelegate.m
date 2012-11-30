//
//  AppDelegate.m
//  CarAssist
//
//  Created by 0witt on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.warningViewController = [[WarningViewController alloc] init];
    self.warningNavigationController = [[UINavigationController alloc] initWithRootViewController:self.warningViewController];
    
    self.tabBarController = [[UITabBarController alloc] init];
    UITabBarItem* tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Peter" image:nil tag:1];
    [self.warningNavigationController setTabBarItem:tabBarItem];
    
    self.tabBarController.viewControllers = [NSArray arrayWithObject:self.warningNavigationController];

    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
