//
//  CallAlertview.m
//  CarAssist
//
//  Created by 0fiedler on 11.01.13.
//  Copyright (c) 2013 Gruppe Fear. All rights reserved.
//

#import "CallAlertview.h"
#import <MessageUI/MFMailComposeViewController.h>
#import "CallViewController.h"
#import <MapKit/MapKit.h>


@implementation CallAlertView

-(id)initCall:(UINavigationController*) controller
{
    return  [self initCall:controller andMessage: Nil];
}

-(id) initCall:(UINavigationController *)controller andMessage: (NSString*) message
{
    self = [super initWithTitle:@"ADAC kontaktieren" message:@"Wollen Sie den ADAC anrufen und Ihre Daten sowie Ihren Standort per E-Mail an den ADAC senden?" delegate:self cancelButtonTitle:@"Abbrechen" otherButtonTitles:@"Anrufen", @"Mail verschicken und anrufen",nil];
    if (self) {
        self.controller = controller;
        self.text = message;
    }
    return self;
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
                CallViewController* viewController = [[CallViewController alloc] initForMailWithWarning: self.text];
                [self.controller pushViewController:viewController animated:NO];
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
