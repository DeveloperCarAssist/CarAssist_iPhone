//
//  StartScreenViewController.h
//  CarAssist
//
//  Created by Erik Witt on 25.01.13.
//  Copyright (c) 2013 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartScreenViewController : UIViewController

@property (nonatomic) IBOutlet UITextView* textView;
@property (nonatomic) IBOutlet UIButton* imageButton;
@property (nonatomic) IBOutlet UIImageView* imageView;

- (IBAction) ok:(id)sender;

@end
