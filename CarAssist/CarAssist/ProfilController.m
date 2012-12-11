//
//  ProfilController.m
//  CarAssist
//
//  Created by 0fiedler on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "ProfilController.h"
#import "Profile.h"

@interface ProfilController ()
@property BOOL wahr;
@property Profile* profil;
@end

@implementation ProfilController

-(ProfilController*) initWithProfil: (Profile*) profil
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.profil=profil;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    [self.navigationItem setTitle: @"Profil"];
    // Do any additional setup after loading the view from its nib.
viewWillAppear: YES;
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.firstName setText:self.profil.vorname];
    [self.lastName setText:self.profil.nachname];
    [self.carModell setText:self.profil.car.model];
    [self.carProducer setText:self.profil.car.manufacturer];
    [self.emailAdress setText:self.profil.emailAdresse];
    [self.lieblingsKEKSEEE setText:self.profil.lieblingsKEKSEEE];
}

-(IBAction) editButtonpressed:(id)sender
{
    if (!self.wahr) {
        [self.firstName setEnabled:YES];
        [self.lastName setEnabled:YES];
      //  [self.carModell setEnabled:YES];
      //  [self.carProducer setEnabled:YES];
        [self.emailAdress setEnabled:YES];
        [self.lieblingsKEKSEEE setEnabled:true];
        self.wahr=YES;
    }
    else
    {
        [self.firstName setEnabled:FALSE];
        self.profil.vorname=[self.firstName text];
        [self.lastName setEnabled:FALSE];
         self.profil.nachname=[self.lastName text];
        [self.carModell setEnabled:FALSE];
        [self.carProducer setEnabled:FALSE];
        [self.emailAdress setEnabled:FALSE];
         self.profil.emailAdresse=[self.emailAdress text];
        [self.lieblingsKEKSEEE setEnabled:false];
         self.profil.lieblingsKEKSEEE=[self.lieblingsKEKSEEE text];
        self.wahr = NO;
    }
}

-(IBAction) carDetailButtonPressed:(id)sender
{
    
}

-(IBAction) carChangeButtonPressed:(id)sender
{
    CarFavoritViewController *carcontroller = [[CarFavoritViewController alloc] initWithProfil: self.profil];
     [self.navigationController pushViewController:carcontroller animated:YES];
    
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
