//
//  AppDelegate.m
//  CarAssist
//
//  Created by 0witt on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    self.warningViewController = [[WarningCategoryViewController alloc] init];
    self.warningNavigationController = [[UINavigationController alloc] initWithRootViewController:self.warningViewController];

    self.serviceViewController = [[ServiceCategoryViewController alloc] init];
    self.serviceNavigationController = [[UINavigationController alloc] initWithRootViewController:self.serviceViewController];
    
    self.settingsViewController=  [[SettingsViewController alloc] init];
    self.settingsNavigationController= [[UINavigationController alloc] initWithRootViewController:self.settingsViewController];

    
    self.tabBarController = [[UITabBarController alloc] init];

    UITabBarItem* tabBarItem1 = [[UITabBarItem alloc] initWithTitle:@"Service" image:[UIImage imageNamed:@"tabbar_service_small"]  tag:1]; 
    [self.serviceNavigationController setTabBarItem:tabBarItem1];
    
    UITabBarItem* tabBarItem2 = [[UITabBarItem alloc] initWithTitle:@"Störungen" image: [UIImage imageNamed:@"tabbar_stoerung_small"]  tag:2];
    [self.warningNavigationController setTabBarItem:tabBarItem2];
    
    UITabBarItem* tabBarItem3 = [[UITabBarItem alloc] initWithTitle:@"Profil" image:[UIImage imageNamed:@"tabbar_profil_small"] tag:3];
    [self.settingsNavigationController setTabBarItem:tabBarItem3];
    
    
    NSArray *viewControllers = [NSArray arrayWithObjects:self.serviceNavigationController,
                                self.warningNavigationController, self.settingsNavigationController, nil];
    
    self.tabBarController.viewControllers = viewControllers;
    

    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
