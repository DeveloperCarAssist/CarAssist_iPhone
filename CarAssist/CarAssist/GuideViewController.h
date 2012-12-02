//
//  GuideViewController.h
//  CarAssist
//
//  Created by Dennis on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Guide.h"

@interface GuideViewController : UIViewController
@property (nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic) Guide *guide;
-(id) initWithGuide:(Guide *)guide;
@end
