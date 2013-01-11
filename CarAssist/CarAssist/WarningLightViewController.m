//
//  WarningLightViewController.m
//  CarAssist
//
//  Created by 0witt on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "WarningLightViewController.h"
#import "Utils.h"
#import <MessageUI/MFMailComposeViewController.h>
#import <MapKit/MapKit.h>
#import "CallViewController.h"


@interface WarningLightViewController ()

@end

@implementation WarningLightViewController

- (WarningLightViewController*) initWithWarningLight: (WarningLight*) warningLight
{
    self = [super init];
    if (self) {
        self.warningLight = warningLight;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Hintergrundgrafik einbinden
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_stoerung_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    self.title = self.warningLight.name;
    self.warningLightTextView.text = self.warningLight.info;
    self.warningLightTextView.layer.borderColor = [UIColor blackColor].CGColor;
    self.warningLightTextView.layer.borderWidth = 1.0f;

    UIImageView *imgView = self.warningLightImageView;
    imgView.image = self.warningLight.image;
    imgView.layer.cornerRadius = 15.0;
    imgView.layer.masksToBounds = YES;
    
    UIBarButtonItem* callButton = [[UIBarButtonItem alloc] initWithTitle: @"ADAC" style:UIBarButtonItemStyleBordered target:self action: @selector(callAdac)];
    [self.navigationItem setRightBarButtonItem: callButton];
    
}

-(void)callAdac
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"ADAC kontaktieren" message:@"Wollen Sie den ADAC anrufen und damit Ihre Daten und Ihren Standord an den ADAC senden?" delegate:self cancelButtonTitle:@"Abbrechen" otherButtonTitles:@"Ja, ich will: Telefon!", @"Ja, ich will: Email und Anrufen!",nil];
    [alert show];
}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    if([alertView.title isEqual: @"ADAC kontaktieren"])
    {
        if(buttonIndex == 1)
        {
            if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel:040555555"]])
            {
                
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:040555555"]];
            }
            else
            {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Kein Telefon" message:@"Diese Funktion benötigt Zugriff zum Telefonieren. Bitte erlauben sie dies." delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
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
                }
                CallViewController* viewController = [[CallViewController alloc] initForMailWithWarning: self.warningLight.name];
                [self.navigationController pushViewController:viewController animated:NO];
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
