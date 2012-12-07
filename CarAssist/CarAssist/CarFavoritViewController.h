//
//  CarFavoritViewController.h
//  CarAssist
//
//  Created by 0fiedler on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profil.h"
#import "CarProfilViewController.h"

@interface CarFavoritViewController : UITableViewController <UIActionSheetDelegate>

-(id) initWithProfil: (Profil*) profil;
@end
