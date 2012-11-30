//
//  ProfilController.h
//  CarAssist
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfilController : UIViewController


-(IBAction) editButtonpressed:(id)sender;
-(IBAction) returnButton:(UITextField*)sender;
-(IBAction) carDetailButtonPressed:(id)sender;
-(IBAction) carChangeButtonPressed:(id)sender;
@property IBOutlet UITextField *firstName, *lastName, *carModell, *carProducer, *emailAdress,*lieblingsKEKSEEE;
@end
