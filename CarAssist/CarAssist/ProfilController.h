//
//  ProfilController.h
//  CarAssist
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarFavoritViewController.h"
#import "Profile.h"

@interface ProfilController : UIViewController
@property IBOutlet UITextField *firstName, *lastName, *carModell, *carProducer, *emailAdress,*lieblingsKEKSEEE;
//Erstellt ein ProfilController und stellt das Profil grapisch da
-(ProfilController*) initWithProfil: (Profile*) profil;

//Wenn der "Persönliche Daten ändern" Butten gedrückt wird
-(IBAction) editButtonpressed:(id)sender;

-(IBAction) returnButton:(UITextField*)sender;
//Deprecated
-(IBAction) carDetailButtonPressed:(id)sender;
//Wenn der Auto Wechseln butten gedrückt wird
-(IBAction) carChangeButtonPressed:(id)sender;



@end
