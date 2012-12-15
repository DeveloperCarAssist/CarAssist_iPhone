//
//  WarningLightCollectionViewController.m
//  CarAssist
//
//  Created by 0witt on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "WarningLightCollectionViewController.h"
#import "WarningLight.h"
#import "WarningLightViewController.h"
#import "WarningLightCollectionViewCell.h"
#import "Profile.h"
#import "Car.h"

@interface WarningLightCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation WarningLightCollectionViewController

- (WarningLightCollectionViewController*)init
{
    self = [super init];
    return self;
}
-(void)dealloc
{
    // Abmeldung am NotificationCenter, wenn das Objekt selbst gelöscht wird
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Service mit dem Standardwagen des Profils initialisieren
    Car *car = [[Profile getProfile] car];
    self.warningLightStockService = [[WarningLightStockService alloc] initWithCar: car];
    
    
    // Anmeldung als Beobachter, wenn der Standard-Wagen geändert wurde
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(defaultCarChanged:) name:@"defaultCarChanged" object:nil];
    
    self.title = @"Warnleuchten";
    [self.warningLightCollectionView registerClass:WarningLightCollectionViewCell.class forCellWithReuseIdentifier:@"WarningLightCollectionViewCell"];
}

// Nachricht defaultCarChanged behandeln
-(void)defaultCarChanged:(NSNotification *)notification
{
    Car *car = [notification.userInfo objectForKey:@"car"];
    self.warningLightStockService = [[WarningLightStockService alloc] initWithCar: car];
    [self.warningLightCollectionView reloadData];
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.warningLightStockService.warningLights.count;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    WarningLight* currentWarningLight = [self.warningLightStockService.warningLights objectAtIndex:indexPath.row];
    
    WarningLightCollectionViewCell* cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WarningLightCollectionViewCell" forIndexPath:indexPath];
    
    [cell setWarningLightImage: currentWarningLight.image];
    
    return cell;
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    WarningLight* currentWarningLight = [self.warningLightStockService.warningLights objectAtIndex:indexPath.row];
    WarningLightViewController* viewController = [[WarningLightViewController alloc] initWithWarningLight: currentWarningLight];
    
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
