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

-(id) init
{
    self = [super initWithNibName:@"CategoryViewController" bundle:nil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Service";
    // Hintergrundgrafik einbinden
    self.categoryTableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_service_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    // Service mit dem Standardwagen des Profils initialisieren
    Car *car = [[Profile getProfile] car];
    self.categoryService = [[ServiceGuideStockService alloc] initWithCar:car];
    
	// Do any additional setup after loading the view.
}


-(void)decorateSectionHeader:(UIView *)view withLabel:(UILabel *)label
{
    view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"section_service"] scaledToSize: view.frame.size]];
}

// Nachricht defaultCarChanged behandeln


-(void)defaultCarChanged:(NSNotification *)notification
{
 Car *car = [notification.userInfo objectForKey:@"car"];
 self.categoryService = [[ServiceGuideStockService alloc] initWithCar: car];
 [self.navigationController popToRootViewControllerAnimated:false];
 [self.categoryTableView reloadData];
}



@end
