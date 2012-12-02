//
//  CarProfilViewController.h
//  CarAssist
//
//  Created by 0fiedler on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"
#import "Profil.h"

@interface CarProfilViewController : UIViewController

@property (nonatomic) IBOutlet UITextField *modell,*producer,*radio,*navigation,*seatHeater;
@property Car *car;
@property Profil *profil;

-(CarProfilViewController*) initWithCar: (Car*) car;
-(CarProfilViewController*) initWithProfil: (Profil*) profil;
-(IBAction)saveButtonPressed:(id)sender;

-(IBAction) returnButton:(UITextField*)sender;
@end
