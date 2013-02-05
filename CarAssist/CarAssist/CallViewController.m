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
@property NSInteger useCase;
@property NSString* warning;
@end

@implementation CallViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
    }
    return self;
}
-(id) initForMailWithWarning:(NSString*) warning;
{
    self = [super init];
    if (self) {
        self.useCase = 0;
        if(warning != nil)
        {
            self.warning = [NSString stringWithFormat: @" \n Es leuchtete folgende Warnleuchte auf: %@", warning];
        }
        else{
            self.warning = @"";
        }
    }
    return self;
}

-(id) initForCall
{
    self = [super init];
    if (self) {
         self.useCase = 1;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (self.useCase == 0 ) {
    if(self.locationManager == Nil)
    {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    }
 
                [self.locationManager startUpdatingLocation];
    }
    if(self.useCase == 1)
    {
        [self callADAC];
    }
    self.view.opaque = NO;
    self.view.backgroundColor = [UIColor clearColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    if(result != MFMailComposeResultCancelled)
    {  
        [self callADAC];
    }
      [self dismissViewControllerAnimated:YES completion:nil];    
    [self.navigationController popViewControllerAnimated:NO];

}

-(void) callADAC
{
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"tel:001"]])
    {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"tel:001"]];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Kein Telefon" message:@"Diese Funktion benötigt Zugriff zum Telefon. Bitte erlauben sie dies." delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }
}
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{

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
    
    
    
    NSMutableString* title = [NSMutableString stringWithFormat: @"Pannennotruf:"];
    NSMutableString* text = [[NSMutableString alloc] initWithString: @"Bitte geben sie ihre Probleme ein. \n Anbei sind noch einige Daten für die Pannenhilfe:"];
    
    
    if(profil.ADAClicence.length != 0)
    {
        [text appendString: @"\n ADAC Nummer:"];
        [text appendString: profil.ADAClicence];
        [title appendString: profil.ADAClicence];
    }
    if(profil.vorname.length != 0)
    {
        [text appendString: @"\n Vorname:"];
        [text appendString: profil.vorname];
        [title appendString: @"," ];
        [title appendString: profil.vorname ];
    }
    if(profil.nachname.length != 0)
    {
        [text appendString: @"\n Nachname:"];
        [text appendString: profil.nachname];
        [title appendString: profil.nachname ];
    }
    if(profil.ADAClicence.length != 0)
    {
        [text appendString: @"\n ADAC Nummer:"];
        [text appendString: profil.ADAClicence];
    } 
        [text appendString: @"\n Fahrzeug:"];
        [text appendString: profil.car.model];
    
        [text appendString: @"\n Hersteller:"];
        [text appendString: profil.car.manufacturer];
    
    if(loc != Nil)
    {
        [text appendString: @"\n Letzter Bekannter Ord in GPS-Koordianten:"];
        [text appendString: [NSString stringWithFormat:@" %e %e", loc.coordinate.latitude,loc.coordinate.longitude]];
        
    }
    
    [mailViewController setSubject: title];
    [mailViewController setMessageBody: text isHTML:NO];
    
    [self presentViewController:mailViewController animated:NO completion: Nil];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *) error
{
    [manager stopUpdatingLocation];
    if(error.code == kCLErrorDenied)
    {
        UIAlertView *message = [[UIAlertView alloc] initWithTitle:@"Hinweis" message:@"Bitte erlauben Sie den Zugriff auf den Ortungsdienst in den Telefoneinstellungen." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [message show];
    }
[self locationManager:nil didUpdateLocations:nil];
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
