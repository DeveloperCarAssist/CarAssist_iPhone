//
//  WarningViewController.m
//  CarAssist
//
//  Created by 0witt on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "WarningCategoryViewController.h"
#import "WarningLightCollectionViewController.h"
#import "AuthorizedRepairCategoryViewController.h"
#import <MapKit/MapKit.h>
#import <MessageUI/MFMailComposeViewController.h>


#import "Utils.h"
#import "Profile.h"
#import "CallViewController.h"




@interface WarningCategoryViewController () <UITableViewDataSource, UITableViewDelegate,UIAlertViewDelegate>

@end

@implementation WarningCategoryViewController


- (void)viewDidLoad
{
 
    [super viewDidLoad];
    self.title = @"Störungen";
    
    // Hintergrundgrafik einbinden
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_stoerung_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    //TableView
    self.warningCatergoryTableView.separatorColor = [UIColor blackColor];
    
    // Anmeldung als Beobachter, wenn der Standard-Wagen geändert wurde
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(defaultCarChanged:) name:@"defaultCarChanged" object:nil];
}
-(void)dealloc
{
    // Abmeldung am NotificationCenter, wenn das Objekt selbst gelöscht wird
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// Nachricht defaultCarChanged behandeln
-(void)defaultCarChanged:(NSNotification *)notification
{
    [self.navigationController popToViewController:self animated:NO];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"standard"];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"standard"];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    UIImage* warningLightCategoryImage = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"warnleuchtenKategorie" ofType:@"png"]];
    UIImage* breakdownServiceCategoryImage = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"pannenhilfe" ofType:@"png"]];
    UIImage* authorizedRepairCategoryImage = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"service" ofType:@"png"]];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Warnleuchten";
            [cell.imageView setImage:warningLightCategoryImage];
            break;
        case 1:
            cell.textLabel.text = @"Pannenhilfe anrufen";
            [cell.imageView setImage:breakdownServiceCategoryImage];
            break;
        case 2:
            cell.textLabel.text = @"Vertragswerkstätten";
            [cell.imageView setImage:authorizedRepairCategoryImage];
            break;
        case 3:
            cell.textLabel.text = @"Störung beheben";
            break;
        default:
            cell.textLabel.text = @"Einer zu viel :P";
            break;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        WarningLightCollectionViewController* viewController = [[WarningLightCollectionViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    if(indexPath.row == 1)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ADAC anrufen" message:@"Wollen Sie den ADAC anrufen und damit Ihre Daten und Ihren Standord an den ADAC senden?" delegate:self cancelButtonTitle:@"Abbrechen" otherButtonTitles:@"Ja, ich will: Telefon!", @"Ja, ich will: Email und Anrufen!",nil];
        [alert show];
    }
    if(indexPath.row == 2)
    {
        AuthorizedRepairCategoryViewController* viewController = [[AuthorizedRepairCategoryViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }
    
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    if([alertView.title isEqual: @"ADAC anrufen"])
    {
       if(buttonIndex == 1)
       {
           if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel:040555555"]])
           {

               [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:040555555"]];
           }
           else
           {
               UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Kein Telefon" message:@"Diese Funktion benötigt Zugriff zum Telefon. Bitte erlauben sie dies." delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
               [alert show];
           }
       }
        if(buttonIndex == 2)
        {
            if ([MFMailComposeViewController canSendMail]) {
                if(![CLLocationManager locationServicesEnabled])
                {
                    UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Hinweis" message:@"Um ein Ortungssignal anzugeben muss das GPS aktiviert sein." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                    [message show];
                    
                    CallViewController* viewController = [[CallViewController alloc] initForMail];
                        [self.navigationController pushViewController:viewController animated:NO];
                } else {
                    CallViewController* viewController = [[CallViewController alloc] initForMail];
                    [self.navigationController pushViewController:viewController animated:NO];
                }
            }           
                  else {
                      
                      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                                      message:@"Your device doesn't support the composer sheet"
                                                                     delegate:nil
                                                            cancelButtonTitle:@"OK"
                                                            otherButtonTitles: nil];
                      [alert show];
                      
                  }
        }
    }
}







@end
