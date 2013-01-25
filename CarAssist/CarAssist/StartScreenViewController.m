//
//  StartScreenViewController.m
//  CarAssist
//
//  Created by Erik Witt on 25.01.13.
//  Copyright (c) 2013 Gruppe Fear. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "StartScreenViewController.h"
#import "Utils.h"

@interface StartScreenViewController ()

@end

@implementation StartScreenViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_profil_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    //[self.imageButton setBackgroundImage:[Utils imageWithImage:[UIImage imageNamed:@"black"] scaledToSize:[[UIScreen mainScreen] bounds].size] forState:UIControlStateNormal];
    
    self.imageView.layer.cornerRadius = 15.0;
    self.imageView.layer.masksToBounds = YES;
}

- (IBAction) ok:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
}


@end
