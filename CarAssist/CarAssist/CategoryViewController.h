//
//  ServiceCategoryViewController.h
//  CarAssist
//
//  Created by 0thuerin on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GuideStockService.h"

@interface CategoryViewController : UIViewController
@property (nonatomic) id<GuideStockService> guideStockService;
@property (nonatomic) IBOutlet UITableView* serviceGuideTableView;
@property (nonatomic) IBOutlet UISearchBar* serviceSearchBar;

@property (nonatomic) UITapGestureRecognizer* tapRecognizer;

@end
