//
//  AuthorizedRepairDetailViewController.m
//  CarAssist
//
//  Created by Dennis on 25.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "AuthorizedRepairDetailViewController.h"
#import "Utils.h"

@interface AuthorizedRepairDetailViewController ()
@property (nonatomic) AuthorizedRepair *shop;
@end

@implementation AuthorizedRepairDetailViewController

- (id)initWithAuthorizedRepair:(AuthorizedRepair *) shop
{
    self = [super init];
    if (self) {
        self.shop = shop;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Filiale";
    // Hintergrundgrafik einbinden
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_stoerung_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    // Kartenposition und sichtbaren Bereich setzen
    MKCoordinateSpan span;
    span.latitudeDelta = 0.005;
    span.longitudeDelta = 0.005;
    
    MKCoordinateRegion region = MKCoordinateRegionMake(self.shop.location, span);
    self.mapView.region = region;
    
    // Marker auf der Karte
    NSMutableString *address =[[NSMutableString alloc] init];
    [address appendString:self.shop.street];
    [address appendString:@", "];
    [address appendString:self.shop.postalcode];
    [address appendString:@" "];
    [address appendString:self.shop.city];
    
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.title = self.shop.name;
    point.subtitle = address;
    point.coordinate = self.shop.location;
    
    
    [self.mapView addAnnotation:point];
    [self.mapView selectAnnotation:point animated:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
