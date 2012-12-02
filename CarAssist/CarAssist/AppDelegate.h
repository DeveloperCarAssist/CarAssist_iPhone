//
//  AppDelegate.h
//  CarAssist
//
//  Created by 0witt on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WarningCategoryViewController.h"

@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// Main ViewContainer
@property (nonatomic) UITabBarController* tabBarController;

// Warning Controllers
@property (nonatomic) WarningCategoryViewController* warningViewController;
@property (nonatomic) UINavigationController* warningNavigationController;

@end
