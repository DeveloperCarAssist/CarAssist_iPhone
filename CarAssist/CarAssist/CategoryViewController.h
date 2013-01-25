//
//  ServiceCategoryViewController.h
//  CarAssist
//
//  Created by 0thuerin on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchableServiceProtocol.h"
#import "SearchableItem.h"

@interface CategoryViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic) id<SearchableServiceProtocol> categoryService;
@property (nonatomic) IBOutlet UITableView* categoryTableView;
@property (nonatomic) IBOutlet UISearchBar* categorySearchBar;
@property (nonatomic) UITapGestureRecognizer* tapRecognizer;

-(void)decorateCell:(UITableViewCell *)cell withItem:(id<SearchableItem>)item;
-(void)decorateSectionHeader:(UIView *)view withLabel:(UILabel *)label;
@end
