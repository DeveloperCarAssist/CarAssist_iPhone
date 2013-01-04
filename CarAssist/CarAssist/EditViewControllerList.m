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

- (EditViewController*) initWithDelegate: (UIViewController*) delegate Values: (NSArray*) values ValueRepresentation: (NSArray*) valueRepresentation AndSelectedValueIndex: (int) selectedValueIndex
{
    self = [super initWithDelegate:delegate Values:values ValueRepresentation:valueRepresentation AndSelectedValueIndex:selectedValueIndex];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Werkstattliste";
    
    UIBarButtonItem* saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action: @selector(saveCarButtonClicked)];
    [self.navigationItem setRightBarButtonItem: saveButton];
    
    
    // Hintergrundgrafik einbinden
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_profil_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    //Searchbar
    self.garageSearchBar.tintColor = [UIColor lightGrayColor];
    
    //TableView
    self.garageSelectionTableView.separatorColor = [UIColor blackColor];
    
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.valueRepresentations.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"standard"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"standard"];
    }

    cell.textLabel.text = [self.valueRepresentations objectAtIndex:indexPath.row];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    return cell;
}


//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
//{
//    
//    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 22)];
//    //!todo hier noch schöner Hintergrund einbinden
//    sectionView.backgroundColor = [UIColor lightGrayColor];
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:sectionView.frame];
//    label.textColor = [UIColor blackColor];
//    label.backgroundColor = [UIColor clearColor];
//    label.text = @"Werkstätten";
//    label.textAlignment = NSTextAlignmentCenter;
//    label.font = [UIFont boldSystemFontOfSize:18];
//    
//    
//    [sectionView addSubview:label];
//    return sectionView;
//}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.selectedValueIndex = indexPath.row;
}

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
//    [self.carListService reduceCarsWithSearchText: searchText];
//    [self.carSelectionTableView reloadData];
}

/**
 * Diese Methode sorgt für das Speichern des ausgewählten Autos
 */
- (void) saveCarButtonClicked
{
    [self saveSetting];
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 * Schließt das Keyboard, wenn Suchen gedrückt wird.
 */
- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.garageSearchBar resignFirstResponder];
}

/**
 * Schließt das Keyboard.
 */
-(void)didTapAnywhere: (UITapGestureRecognizer*) recognizer {
    [self.garageSearchBar resignFirstResponder];
}


- (void) display
{
    [self.delegate.navigationController pushViewController:self animated:YES];
}

@end
