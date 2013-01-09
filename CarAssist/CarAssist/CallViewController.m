//
//  CallViewController.m
//  CarAssist
//
//  Created by 0fiedler on 09.01.13.
//  Copyright (c) 2013 Gruppe Fear. All rights reserved.
//

#import "CallViewController.h"
#import <MapKit/MapKit.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "Profile.h"

@interface CallViewController () <MFMailComposeViewControllerDelegate, CLLocationManagerDelegate >

@property (nonatomic) CLLocationManager *locationManager;

@end

@implementation CallViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id) initForMail
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(self.locationManager == Nil)
    {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    }
                [self.locationManager startUpdatingLocation];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel:040555555"]])
    {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:040555555"]];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Kein Telefon" message:@"Diese Funktion benötigt Zugriff zum Telefon. Bitte erlauben sie dies." delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
[self.navigationController popViewControllerAnimated:NO];

}

/**
 * Diese Methode wird aufgerufen wenn eine Mail geschickt wurde nachdem der Ort bestimmt wurde / Oder mit nil und nill wenn gps aus ist.
 */
- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray *)locations {
    
    [manager stopUpdatingLocation];
    CLLocation* loc = [locations lastObject];
    MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
    mailViewController.mailComposeDelegate = self;
    NSArray *array =  [[NSArray alloc] initWithObjects:@"CarAssistReport@ADAC.de", nil];
    [mailViewController setToRecipients:array];
    Profile *profil = [Profile getProfile];
    [mailViewController setSubject:[NSString stringWithFormat: @"Pannennotruf: %@ , %@ %@", profil.ADAClicence,profil.nachname,profil.vorname]];
    [mailViewController setMessageBody:[NSString stringWithFormat:@"Bitte geben sie ihre Probleme ein. Anbei sind noch einige Daten für die Pannenhilfe: %@ , %@ %@ %@ %@ Letzer Bekannter Ort in GPS-Coordinaten: %e %e", profil.ADAClicence,profil.nachname,profil.vorname,profil.car.model,profil.car.manufacturer,loc.coordinate.latitude,loc.coordinate.longitude] isHTML:NO];
    
    [self presentViewController:mailViewController animated:NO completion: Nil];
}

/**
 * Diese Methode Vormatiert einen String damit er Von der Mailapp gut dargestellt werden kann.
 */
- (void) sendEmailTo:(NSString *)to withSubject:(NSString *) subject withBody:(NSString *)body {
	NSString *mailString = [NSString stringWithFormat:@"mailto:?to=%@&subject=%@&body=%@",
							[to stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
							[subject stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding],
							[body stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding]];
    NSLog(@"%@",body);
	if([[UIApplication sharedApplication] canOpenURL: [NSURL URLWithString:mailString]])
    {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mailString]];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Kein Telefon" message:@"Diese Funktion benötigt Zugriff zur EmailApp. Bitte erlauben sie dies." delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}
@end
