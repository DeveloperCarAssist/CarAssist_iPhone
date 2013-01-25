//
//  WarningLightViewController.m
//  CarAssist
//
//  Created by 0witt on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "WarningLightViewController.h"
#import "Utils.h"
#import "CallAlertView.h"
#import "AuthorizedRepairCategoryViewController.h"

@interface WarningLightViewController ()

@end

@implementation WarningLightViewController

- (WarningLightViewController*) initWithWarningLight: (WarningLight*) warningLight
{
    self = [super init];
    if (self) {
        self.warningLight = warningLight;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Hintergrundgrafik einbinden
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_stoerung_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    //self.title = self.warningLight.name;
    self.warningLightNameView.text = self.warningLight.name;

    self.warningLightTextView.text = self.warningLight.info;
    self.warningLightTextView.layer.borderColor = [UIColor blackColor].CGColor;
    self.warningLightTextView.layer.borderWidth = 1.0f;

    UIImageView *imgView = self.warningLightImageView;
    imgView.image = self.warningLight.image;
    imgView.layer.cornerRadius = 15.0;
    imgView.layer.masksToBounds = YES;
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithTitle:@"Werkstatt" style:UIBarButtonItemStylePlain target:self action:@selector(goToWerkstatt)];
    
    UIBarButtonItem* addButton2 = [[UIBarButtonItem alloc] initWithTitle:@"ADAC" style:UIBarButtonItemStylePlain target:self action:@selector(callAdac)];
    
    NSArray* array = [NSArray arrayWithObjects:addButton, addButton2,nil];
    
     [self.navigationItem setRightBarButtonItems: array animated:YES];
    
    // Dynamisch textgröße anpassen
    int bigSize = MAX(self.warningLight.name.length, 18);
    CGFloat newSize = (26.0 / bigSize) * 18;
    self.warningLightNameView.font = [self.warningLightNameView.font fontWithSize: newSize];

}

-(void)callAdac
{
    CallAlertView *alert = [[CallAlertView alloc] initCall: self.navigationController andMessage: self.warningLight.name];
    [alert show];
}
-(void)goToWerkstatt
{
    AuthorizedRepairCategoryViewController* viewController = [[AuthorizedRepairCategoryViewController alloc] init];
    [self.navigationController pushViewController:viewController animated:YES];
}


@end
