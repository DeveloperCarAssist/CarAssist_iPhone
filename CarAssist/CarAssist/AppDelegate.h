//
//  AppDelegate.h
//  CarAssist
//
//  Created by 0witt on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ManualCategoryViewController.h"
#import "ServiceCategoryViewController.h"
#import "WarningCategoryViewController.h"
#import "CarFavoritViewController.h"


@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// Main ViewContainer
@property (nonatomic) UITabBarController* tabBarController;

// Manual Controllers
@property (nonatomic) ManualCategoryViewController* manualViewController;
@property (nonatomic) UINavigationController* manualNavigationController;

// Warning Controllers
@property (nonatomic) WarningCategoryViewController* warningViewController;
@property (nonatomic) UINavigationController* warningNavigationController;

// Service Controllers
@property (nonatomic) ServiceCategoryViewController* serviceViewController;
@property (nonatomic) UINavigationController* serviceNavigationController;


// Profil Controllers
@property (nonatomic) CarFavoritViewController* carFavoritViewController;
@property (nonatomic) UINavigationController* settingsNavigationController;

@end
