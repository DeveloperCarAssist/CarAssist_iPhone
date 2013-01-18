//
//  CarFavoriteViewController.h
//  CarAssist
//
//  Created by 0witt on 12.01.13.
//  Copyright (c) 2013 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"

@interface CarFavoriteViewController : UIViewController

@property (nonatomic) IBOutlet UITableView* carFavoriteTableView;

- (IBAction)useCamera:(id)sender;

@end