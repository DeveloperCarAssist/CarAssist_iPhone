//
//  CarProfilViewController.m
//  CarAssist
//
//  Created by 0fiedler on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "CarProfilViewController.h"

@interface CarProfilViewController ()
@property BOOL newCar;
@end

@implementation CarProfilViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(CarProfilViewController*) initWithCar: (Car*) car
{
    self = [super init];
    if (self) {
        self.car=car;
        self.newCar=NO;
    }
    return self;
}
-(CarProfilViewController*) initWithProfil: (Profil*) profil
{
    self = [super init];
    if (self) {
    Car *car = [[Car alloc] initNewCar];
        self.newCar= YES;
        self.car = car;
        self.profil = profil;
    }
return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self.modell setText: self.car.modell];
    [self.producer setText:self.car.producer];
    [self.radio setText:self.car.radio];
    [self.navigation setText:self.car.navigation];
    [self.seatHeater setText: self.car.seatHeater];
}

-(IBAction)saveButtonPressed:(id)sender
{
    if(self.newCar)
    {
    self.profil.car = self.car;
        [self.profil.carList addObject: self.car];
        self.newCar=NO;
    }
self.car.modell = [self.modell text];
self.car.producer = [self.producer text];
self.car.radio = [self.radio text];
self.car.navigation = [self.navigation text];
self.car.seatHeater = [self.seatHeater text];
}

-(IBAction) returnButton:(UITextField*)sender
{
    [sender resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
