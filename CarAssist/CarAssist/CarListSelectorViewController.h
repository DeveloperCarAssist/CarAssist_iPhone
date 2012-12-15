//
//  CarListSelectorViewController.h
//  CarAssist
//
//  Created by 0witt on 07.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CarListService.h"
#import "Car.h"

@protocol CarListSelectorDelegate;

@interface CarListSelectorViewController : UIViewController

@property (nonatomic) CarListService* carListService;
@property (nonatomic) IBOutlet UISearchBar* carSearchBar;
@property (nonatomic) IBOutlet UITableView* carSelectionTableView;

@property (nonatomic, weak) NSObject<CarListSelectorDelegate>* delegate;
@property (nonatomic) UITapGestureRecognizer* tapRecognizer;

- (id)initWithDelegate:(NSObject<CarListSelectorDelegate>*) delegate andFirstStart: (BOOL) firstStart;

@end

@protocol CarListSelectorDelegate

- (void) carHasBeenSelected:(Car*) selectedCar;

@end
