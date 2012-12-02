//
//  GuideViewController.m
//  CarAssist
//
//  Created by Dennis on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "GuideViewController.h"
#import "StepView.h"

@interface GuideViewController ()

@end

@implementation GuideViewController

-(id) initWithGuide:(Guide *)guide
{
    self = [super init];
    if(self)
    {
        self.guide = guide;
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSArray *steps = self.guide.steps; // Array von Step
    for (int i = 0; i<steps.count; i++) {
        CGRect frame;
        frame.origin.x = i * self.scrollView.frame.size.width;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        
        Step *step = [steps objectAtIndex:i];
        StepView *subView = [[StepView alloc] initWithFrame:frame];
        subView.nameLabel.text = step.name;

        [self.scrollView addSubview:subView];
    }
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * steps.count, self.scrollView.frame.size.height);
    
    self.title = self.guide.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
