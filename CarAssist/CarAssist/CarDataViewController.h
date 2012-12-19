//
//  CarDataViewController.h
//  CarAssist
//
//  Created by 0fiedler on 08.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"
#import "SettingsValueService.h"

@interface CarDataViewController : UITableViewController

@property (nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic) SettingsValueService* settingsValueService;

// Maps from section name to list (NSArray) of SettingCells
@property (nonatomic) NSMutableDictionary* settingsList;
@property (nonatomic) NSMutableArray* sectionList;

-(CarDataViewController*)initWithCar: (Car*)car;


@end
