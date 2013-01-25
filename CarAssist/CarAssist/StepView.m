//
//  StepView.m
//  CarAssist
//
//  Created by 0thuerin on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "StepView.h"

@implementation StepView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [[NSBundle mainBundle] loadNibNamed:@"StepView" owner:self options:nil];
        self.mainView.bounds = self.bounds;
        [self addSubview: self.mainView];
    }
    
    
    
    return self;
}



@end
