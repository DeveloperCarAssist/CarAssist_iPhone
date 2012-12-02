//
//  ProfilController.h
//  CarAssist
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarFavoritViewController.h"
#import "Profil.h"

@interface ProfilController : UIViewController
@property IBOutlet UITextField *firstName, *lastName, *carModell, *carProducer, *emailAdress,*lieblingsKEKSEEE;

-(ProfilController*) initWithProfil: (Profil*) profil;


-(IBAction) editButtonpressed:(id)sender;
-(IBAction) returnButton:(UITextField*)sender;
-(IBAction) carDetailButtonPressed:(id)sender;
-(IBAction) carChangeButtonPressed:(id)sender;



@end
