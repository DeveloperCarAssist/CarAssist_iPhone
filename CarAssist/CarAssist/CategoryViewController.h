//
//  ServiceCategoryViewController.h
//  CarAssist
//
//  Created by 0thuerin on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuideService.h"

@interface CategoryViewController : UIViewController
@property (nonatomic) id<GuideService> categoryService;
@property (nonatomic) IBOutlet UITableView* categoryTableView;
@property (nonatomic) IBOutlet UISearchBar* categorySearchBar;

@property (nonatomic) UITapGestureRecognizer* tapRecognizer;

@end
