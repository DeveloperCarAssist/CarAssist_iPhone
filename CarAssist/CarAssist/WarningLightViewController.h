//
//  WarningLightViewController.h
//  CarAssist
//
//  Created by 0witt on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WarningLight.h"

@interface WarningLightViewController : UIViewController

@property (nonatomic) IBOutlet UIImageView* warningLightImageView;
@property (nonatomic) IBOutlet UITextView* warningLightTextView;
@property (nonatomic) IBOutlet UITextView* warningLightNameView;
@property (nonatomic) WarningLight* warningLight;
@property (nonatomic) IBOutlet UILabel* warningLightImageLabel;

- (WarningLightViewController*) initWithWarningLight: (WarningLight*) warningLight;

@end
