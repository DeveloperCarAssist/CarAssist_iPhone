//
//  CallAlertview.h
//  CarAssist
//
//  Created by 0fiedler on 11.01.13.
//  Copyright (c) 2013 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CallAlertView : UIAlertView
@property (nonatomic) UINavigationController*  controller;
@property (nonatomic, copy) NSString* text;

/**
 * Init den Alertview und benötigt den controller zum puschen des CallviewController
 */
-(id) initCall:(UINavigationController*) controller;
/**
 * Init den Alertview und benötigt den controller zum puschen des CallviewController sowie eine Message zum abbilden
 */
-(id) initCall:(UINavigationController *)controller andMessage: (NSString*) message;

@end

