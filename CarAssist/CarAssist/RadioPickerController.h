//
//  RadioPickerController.h
//  CarAssist
//
//  Created by 0fiedler on 08.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Car.h"
#import "AccessoryService.h"
@interface RadioPickerController : UIViewController < UIPickerViewDataSource, UIPickerViewDelegate >
@property IBOutlet UIImageView *imageView;
-(RadioPickerController*) initWithCar: (Car*) car andAccessoryService:(AccessoryService*) accessoryService;
@end
