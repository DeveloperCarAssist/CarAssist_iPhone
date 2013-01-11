//
//  CarDataViewController.h
//  CarAssist
//
//  Created by Dennis on 11.01.13.
//  Copyright (c) 2013 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"
#import "SettingsValueService.h"

@interface CarDataViewController : UIViewController
@property (nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic) SettingsValueService* settingsValueService;

// Maps from section name to list (NSArray) of SettingCells
@property (nonatomic) NSMutableDictionary* settingsList;
@property (nonatomic) NSMutableArray* sectionList;

-(CarDataViewController*)initWithCar: (Car*)car;
@end
