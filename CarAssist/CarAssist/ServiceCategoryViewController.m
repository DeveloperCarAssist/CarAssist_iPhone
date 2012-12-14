//
//  ServiceCategoryViewController.m
//  CarAssist
//
//  Created by Dennis on 14.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "ServiceCategoryViewController.h"
#import "ServiceGuideStockService.h"
#import "Profile.h"
#import "Utils.h"

@interface ServiceCategoryViewController ()

@end

@implementation ServiceCategoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Service";
    // Hintergrundgrafik einbinden
    self.serviceGuideTableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_service"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    // Service mit dem Standardwagen des Profils initialisieren
    Car *car = [[Profile getProfile] car];
    self.serviceGuideStockService = [[ServiceGuideStockService alloc] initWithCar:car];
    
	// Do any additional setup after loading the view.
}

// Nachricht defaultCarChanged behandeln


-(void)defaultCarChanged:(NSNotification *)notification
{
 Car *car = [notification.userInfo objectForKey:@"car"];
 self.serviceGuideStockService = [[ServiceGuideStockService alloc] initWithCar: car];
 [self.navigationController popToRootViewControllerAnimated:false];
 [self.serviceGuideTableView reloadData];
}



@end
