//
//  CarProfilViewController.h
//  CarAssist
//
//  Created by 0fiedler on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"

@interface CarProfilViewController : UIViewController

@property (nonatomic) IBOutlet UITextField *modell,*producer,*radio,*navigation,*seatHeater;
@property Car *car;

-(CarProfilViewController*) initWithCar: (Car*) car;

@end
