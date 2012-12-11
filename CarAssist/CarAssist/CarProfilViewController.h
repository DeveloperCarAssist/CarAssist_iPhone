//
//  CarProfilViewController.h
//  CarAssist
//
//  Created by 0fiedler on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"
#import "Profile.h"

@interface CarProfilViewController : UIViewController

@property (nonatomic) IBOutlet UITextField *modell,*producer,*radio,*navigation,*seatHeater;
@property IBOutlet UIButton *modelButton;
@property Car *car;
@property Profile *profil;
//Der Controller wird mit einem Car geöffnet wenn dieses Verändert wird
-(CarProfilViewController*) initWithCar: (Car*) car;
//Der Controller wird mit einem Profil erstellt, wenn ein neues Auto erstellt wird
-(CarProfilViewController*) initWithProfil: (Profile*) profil;

//SpeicherButton
-(IBAction)saveButtonPressed:(id)sender;
//Wenn auf den ModellButton Gedrückt wird
-(IBAction)modellButtonPressd:(id)sender;

-(IBAction) returnButton:(UITextField*)sender;
@end
