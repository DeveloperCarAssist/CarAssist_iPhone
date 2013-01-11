//
//  EditViewControllerList.h
//  CarAssist
//
//  Created by 0witt on 21.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "EditViewController.h"
#import "SearchableService.h"

@interface EditViewControllerList : EditViewController

@property (nonatomic) IBOutlet UISearchBar* valueSearchBar;
@property (nonatomic) IBOutlet UITableView* valueSelectionTableView;
@property (nonatomic) SearchableService* searchableService;

- (EditViewController*) initWithDelegate: (UIViewController*) delegate AndSearchableValueService: (SearchableService*) searchableValueService;

@end
