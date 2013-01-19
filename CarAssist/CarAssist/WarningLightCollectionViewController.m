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
#import "Utils.h"
#import "SNPopupView.h"

@interface WarningLightCollectionViewController () <UICollectionViewDataSource, UICollectionViewDelegate,SNPopupViewModalDelegate>
@property (nonatomic) SNPopupView *popup;
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
    
    
    // Hintergrundgrafik einbinden
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_stoerung_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    // Service mit dem Standardwagen des Profils initialisieren
    Car *car = [[Profile getProfile] car];
    self.warningLightStockService = [[WarningLightStockService alloc] initWithCar: car];
    
    
    // Anmeldung als Beobachter, wenn der Standard-Wagen geändert wurde
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(defaultCarChanged:) name:@"defaultCarChanged" object:nil];
    
    self.title = @"Warnleuchten";
    [self.warningLightCollectionView registerClass:WarningLightCollectionViewCell.class forCellWithReuseIdentifier:@"WarningLightCollectionViewCell"];
    
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self
                                               action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 0.5;
    [self.view addGestureRecognizer:longPress];
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

/**
*Kümmert sich drum das beim Langklick der Popupview gezeigt wird und am ende wieder dismissed wird.
*/
-(void)handleLongPress:(UILongPressGestureRecognizer*)recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan){
        CGPoint location = [recognizer locationInView:self.view];
        
        
        if (CGRectContainsPoint([self.view convertRect:self.warningLightCollectionView.frame fromView:self.warningLightCollectionView.superview], location))
        {
            CGPoint locationInTableview = [self.warningLightCollectionView convertPoint:location fromView:self.view];
            NSIndexPath *indexPath = [self.warningLightCollectionView indexPathForItemAtPoint:locationInTableview];
            if (indexPath)
            {
                WarningLight* currentWarningLight = [self.warningLightStockService.warningLights objectAtIndex:indexPath.row];
             
                self.popup = [[SNPopupView alloc] initWithString: currentWarningLight.name  withFontOfSize:15];
                [self.popup showAtPoint:location inView:self.view animated:YES];
                [self.popup addTarget:self action:@selector(didTouchPopupView:)];
                [self.popup setDelegate:self];
                [self.popup setBackroundAlpha:1.0];
            }
        }
        
    }
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [self.popup dismiss];
    }
}

- (void)didDismissModal:(SNPopupView*)popupview
{
    if (popupview == self.popup) {
		self.popup = nil;
	}
}


@end
