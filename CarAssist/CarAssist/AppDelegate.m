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

    self.warningViewController = [[WarningCategoryViewController alloc] init];
    self.warningNavigationController = [[UINavigationController alloc] initWithRootViewController:self.warningViewController];

    self.serviceViewController = [[ServiceCategoryViewController alloc] init];
    self.serviceNavigationController = [[UINavigationController alloc] initWithRootViewController:self.serviceViewController];
    
    self.profilController=  [[ProfilController alloc] initWithProfil: [[Profil alloc] initWithExampleData]];
    self.ProfilNavigationController= [[UINavigationController alloc] initWithRootViewController:self.profilController];

    
    self.tabBarController = [[UITabBarController alloc] init];

    UITabBarItem* tabBarItem1 = [[UITabBarItem alloc] initWithTitle:@"Service" image:nil tag:1];
    [self.serviceNavigationController setTabBarItem:tabBarItem1];
    
    UITabBarItem* tabBarItem2 = [[UITabBarItem alloc] initWithTitle:@"Störungen" image:nil tag:2];
    [self.warningNavigationController setTabBarItem:tabBarItem2];
    
    UITabBarItem* tabBarItem3 = [[UITabBarItem alloc] initWithTitle:@"Profil" image:nil tag:3];
    [self.ProfilNavigationController setTabBarItem:tabBarItem3];
    
    
    NSArray *viewControllers = [NSArray arrayWithObjects:self.serviceNavigationController,
                                self.warningNavigationController, self.ProfilNavigationController, nil];
    
    self.tabBarController.viewControllers = viewControllers;
    

    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}


@end
