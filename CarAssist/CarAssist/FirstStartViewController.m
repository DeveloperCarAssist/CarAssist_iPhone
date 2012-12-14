//
//  FirstStartViewController.m
//  CarAssist
//
//  Created by 0fiedler on 14.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "FirstStartViewController.h"
#import "CarListSelectorViewController.h"
#import "Profile.h"

@interface FirstStartViewController () <CarListSelectorDelegate>
@property UIWindow* uiWindow;
@property UITabBarController* tabBarController;
@end

@implementation FirstStartViewController

-(FirstStartViewController*) initWithUiWindow: (UIWindow*) uiWindow andTabBarController: (UITabBarController*) tabBarController
{
    self = [super init];
    if (self) {
        self.uiWindow = uiWindow;
        self.tabBarController = tabBarController;
    }
    return self;
}

-(IBAction) listButtonClicked:(id)sender
{
    CarListSelectorViewController* controller = [[CarListSelectorViewController alloc] initWithDelegate:self];
    [self.navigationController pushViewController:controller animated:YES];
    
}
-(IBAction) doneButtonClicked:(id)sender
{
        CarListService *carListService = [[CarListService alloc] init];
    Car* car = [carListService returnCarByVehicalIdentNumber: self.vinNumber.text];
    if(car)
    {
       
            [self carHasBeenSelected: car];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Achtung"
                                                        message:@"Nummer Leider nicht gefunden"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) carHasBeenSelected:(Car *)selectedCar
{
    [Profile setProfilWithCar: selectedCar];
    self.uiWindow.rootViewController = self.tabBarController;
}
@end
