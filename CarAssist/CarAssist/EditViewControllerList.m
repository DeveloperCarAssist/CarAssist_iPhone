//
//  EditViewControllerList.m
//  CarAssist
//
//  Created by 0witt on 21.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "EditViewControllerList.h"
#import "Utils.h"

@interface EditViewControllerList () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic) UITapGestureRecognizer* tapRecognizer;

@end

@implementation EditViewControllerList

- (EditViewController*) initWithDelegate: (UIViewController*) delegate AndSearchableValueService: (SearchableService*) searchableValueService;
{
    self = [super initWithDelegate:delegate];
    if (self) {
        self.searchableService = searchableValueService;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Werkstattliste";
    
    
    // Hintergrundgrafik einbinden
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_gelb"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    //TableView
    self.valueSelectionTableView.separatorColor = [UIColor blackColor];
    
    // TapRecognizer, der bei jedem Tab auf unsere View (ausserhalb des Keyboards) das Keyboard schließt.
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAnywhere:)];
    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:
     UIKeyboardWillShowNotification object:nil];
    
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:
     UIKeyboardWillHideNotification object:nil];
}

-(void) keyboardWillShow:(NSNotification*) note
{
    [self.view addGestureRecognizer:self.tapRecognizer];
}

-(void) keyboardWillHide:(NSNotification*) note
{
    [self.view removeGestureRecognizer:self.tapRecognizer];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.searchableService.items allKeys].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray* keys = [self.searchableService.items allKeys];
    NSString* key = [keys objectAtIndex:section];
    NSArray* itemsInSection = [self.searchableService.items objectForKey: key];
    
    return itemsInSection.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"standard"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"standard"];
    }

    NSArray* keys = [self.searchableService.items allKeys];
    NSString* key = [keys objectAtIndex:indexPath.section];
    NSArray* itemsInSection = [self.searchableService.items objectForKey: key];
    
    cell.textLabel.text = [[itemsInSection objectAtIndex:indexPath.row] name];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    //cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    NSArray *keys = [self.searchableService.items allKeys];
    NSString *key = [keys objectAtIndex:section];
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 22)];
    //!todo hier noch schöneren Hintergrund einbauen
    sectionView.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:sectionView.frame];
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor clearColor];
    label.text = key;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:18];
    
    sectionView.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"section_gelb"] scaledToSize: sectionView.frame.size]];
    
    [sectionView addSubview:label];
    return sectionView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray* keys = [self.searchableService.items allKeys];
    NSString* key = [keys objectAtIndex:indexPath.section];
    NSArray* itemsInSection = [self.searchableService.items objectForKey: key];
    
    self.value = [itemsInSection objectAtIndex:indexPath.row];
    self.valueRepresentation = [[itemsInSection objectAtIndex:indexPath.row] name];

    [self saveSetting];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
   [self.searchableService reduceItemsWithSearchText: searchText];
   [self.valueSelectionTableView reloadData];
}

/**
 * Schließt das Keyboard, wenn Suchen gedrückt wird.
 */
- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.valueSearchBar resignFirstResponder];
}

/**
 * Schließt das Keyboard.
 */
-(void)didTapAnywhere: (UITapGestureRecognizer*) recognizer {
    [self.valueSearchBar resignFirstResponder];
}


- (void) display
{
    [self.delegate.navigationController pushViewController:self animated:YES];
}

@end
