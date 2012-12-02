//
//  CarProfilViewController.m
//  CarAssist
//
//  Created by 0fiedler on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "CarProfilViewController.h"

@interface CarProfilViewController ()

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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
