//
//  AuthorizedRepairDetailViewController.m
//  CarAssist
//
//  Created by Dennis on 25.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "AuthorizedRepairDetailViewController.h"

@interface AuthorizedRepairDetailViewController ()

@end

@implementation AuthorizedRepairDetailViewController

- (id)initWithAuthorizedRepair:(AuthorizedRepair *) shop
{
    self = [super init];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Filiale";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
