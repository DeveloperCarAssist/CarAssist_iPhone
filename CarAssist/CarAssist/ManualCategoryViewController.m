//
//  ManualCategoryViewController.m
//  CarAssist
//
//  Created by Dennis on 14.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "ManualCategoryViewController.h"
#import "ManualGuideStockService.h"
#import "Utils.h"
#import "Profile.h"


@interface ManualCategoryViewController ()

@end

@implementation ManualCategoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Bedienung";
    // Hintergrundgrafik einbinden
    self.serviceGuideTableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_bedienung"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    // Service mit dem Standardwagen des Profils initialisieren
    Car *car = [[Profile getProfile] car];
    self.guideStockService = [[ManualGuideStockService alloc] initWithCar:car];
    
	// Do any additional setup after loading the view.
}

// Nachricht defaultCarChanged behandeln
-(void)defaultCarChanged:(NSNotification *)notification
{
    Car *car = [notification.userInfo objectForKey:@"car"];
    self.guideStockService = [[ManualGuideStockService alloc] initWithCar: car];
    [self.navigationController popToRootViewControllerAnimated:false];
    [self.serviceGuideTableView reloadData];
}

@end
