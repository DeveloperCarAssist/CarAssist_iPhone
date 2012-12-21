//
//  EditViewControllerList.h
//  CarAssist
//
//  Created by 0witt on 21.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewControllerList : EditViewController

@property (nonatomic) IBOutlet UISearchBar* garageSearchBar;
@property (nonatomic) IBOutlet UITableView* garageSelectionTableView;

- (EditViewController*) initWithDelegate: (UIViewController*) delegate Values: (NSArray*) values ValueRepresentation: (NSArray*) valueRepresentation AndSelectedValueIndex: (int) selectedValueIndex;

@end
