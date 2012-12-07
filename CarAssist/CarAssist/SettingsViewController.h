//
//  SettingsViewController.h
//  CarAssist
//
//  Created by 0fiedler on 07.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profil.h"
@interface SettingsViewController : UITableViewController

-(SettingsViewController*) initWithProfil: (Profil*) profil;
@end
