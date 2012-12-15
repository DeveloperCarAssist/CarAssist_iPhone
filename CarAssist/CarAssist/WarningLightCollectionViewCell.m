//
//  WarningLightCollectionViewCell.m
//  CarAssist
//
//  Created by 0witt on 25.11.12.
//  Copyright (c) 2012 0witt. All rights reserved.
//

#import "WarningLightCollectionViewCell.h"
#import <QuartzCore/CoreAnimation.h>

@interface WarningLightCollectionViewCell()

@property (nonatomic) UIImageView* imageView;

@end

@implementation WarningLightCollectionViewCell



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGPoint contentViewCenter = self.contentView.center;
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(contentViewCenter.x - 38, contentViewCenter.y - 38 , 76, 76)];
        
        UIView* view = [[UIView alloc] init];
        [view setBackgroundColor:[UIColor blackColor]];
      
        [self setBackgroundView:view];
        [self.contentView addSubview:self.imageView];
        
        self.layer.cornerRadius = 10;
        self.layer.masksToBounds = YES;
    
      

    }
    return self;
}

-(void) setWarningLightImage: (UIImage*) image
{
    [self.imageView setImage:image];
}

@end
