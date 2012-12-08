//
//  CarDataViewController.h
//  CarAssist
//
//  Created by 0fiedler on 08.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"
@interface CarDataViewController : UITableViewController

-(CarDataViewController*)initWithCar: (Car*)car;
@end
