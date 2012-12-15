//
//  ManualCategoryViewController.m
//  CarAssist
//
//  Created by Dennis on 14.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "ManualCategoryViewController.h"
#import "ManualGuideService.h"
#import "Profile.h"
#import "Utils.h"



@interface ManualCategoryViewController ()

@end

@implementation ManualCategoryViewController

-(id) init
{
    self = [super initWithNibName:@"CategoryViewController" bundle:nil];
    return self;
}
 

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Bedienung";
    // Hintergrundgrafik einbinden
    self.categoryTableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_bedienung_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    // Service mit dem Standardwagen des Profils initialisieren
    Car *car = [[Profile getProfile] car];
    self.categoryService = [[ManualGuideService alloc] initWithCar:car];
    
	// Do any additional setup after loading the view.
}

// Nachricht defaultCarChanged behandeln
-(void)defaultCarChanged:(NSNotification *)notification
{
    Car *car = [notification.userInfo objectForKey:@"car"];
    self.categoryService = [[ManualGuideService alloc] initWithCar: car];
    [self.navigationController popToRootViewControllerAnimated:false];
    [self.categoryTableView reloadData];
}

@end
