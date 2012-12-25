//
//  AuthorizedRepairCategoryControllerViewController.m
//  CarAssist
//
//  Created by Dennis on 21.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "AuthorizedRepairCategoryViewController.h"
#import "Utils.h"
#import "Profile.h"
#import "AuthorizedRepairService.h"
#import "AuthorizedRepairDetailViewController.h"

@interface AuthorizedRepairCategoryViewController ()

@end

@implementation AuthorizedRepairCategoryViewController

-(id) init
{
    self = [super initWithNibName:@"CategoryViewController" bundle:nil];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Vertragswerkstätten";
    // Hintergrundgrafik einbinden
    self.categoryTableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_service_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    // Service mit dem Standardwagen des Profils initialisieren
    Car *car = [[Profile getProfile] car];
    self.categoryService = [[AuthorizedRepairService alloc] initWithCar:car];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *keys = [self.categoryService.items allKeys];
    NSString *key = [keys objectAtIndex:indexPath.section];
    NSArray *items = [self.categoryService.items objectForKey:key];
    AuthorizedRepair *shop = [items objectAtIndex:indexPath.row];
    
    AuthorizedRepairDetailViewController *controller = [[AuthorizedRepairDetailViewController alloc] initWithAuthorizedRepair:shop];
    [self.navigationController pushViewController:controller animated:YES];
    
/*
    GuideViewController *viewController = [[GuideViewController alloc] initWithGuide:[items objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:viewController animated:YES];
*/
}

// Nachricht defaultCarChanged behandeln
-(void)defaultCarChanged:(NSNotification *)notification
{
    Car *car = [[Profile getProfile] car];
    self.categoryService = [[AuthorizedRepairService alloc] initWithCar:car];
}

@end
