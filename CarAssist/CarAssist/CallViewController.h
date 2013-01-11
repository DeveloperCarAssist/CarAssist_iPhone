//
//  CallViewController.h
//  CarAssist
//
//  Created by 0fiedler on 09.01.13.
//  Copyright (c) 2013 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CallViewController : UIViewController
//Hiermit erstellt man sich einen Mailclienten
-(id) initForMail;
-(id) initForMailWithWarning:(NSString*) warning;
@end
