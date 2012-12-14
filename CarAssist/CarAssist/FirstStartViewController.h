//
//  FirstStartViewController.h
//  CarAssist
//
//  Created by 0fiedler on 14.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstStartViewController : UIViewController

@property (nonatomic) IBOutlet UITextField* vinNumber;

-(FirstStartViewController*) initWithUiWindow: (UIWindow*) uiWindow andTabBarController: (UITabBarController*) tabBarController;

-(IBAction) listButtonClicked:(id)sender;
-(IBAction) doneButtonClicked:(id)sender;

@end
