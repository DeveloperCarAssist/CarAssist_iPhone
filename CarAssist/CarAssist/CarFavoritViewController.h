//
//  CarFavoritViewController.h
//  CarAssist
//
//  Created by 0fiedler on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Profile.h"

@interface CarFavoritViewController : UITableViewController <UIActionSheetDelegate,UIAlertViewDelegate>

@property (nonatomic) IBOutlet UITableView* carFavoriteTableView;

- (IBAction)useCamera:(id)sender;

@end
