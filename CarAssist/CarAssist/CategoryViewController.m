//
//  ServiceCategoryViewController.m
//  CarAssist
//
//  Created by 0thuerin on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "CategoryViewController.h"
#import "GuideViewController.h"
#import "Guide.h"
#import "Car.h"

@interface CategoryViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@end

@implementation CategoryViewController


- (void)dealloc {
    // Abmeldung am notification center, wenn das Objekt selbst gelöscht wird
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // TapRecognizer, der bei jedem Tab auf unsere View (ausserhalb des Keyboards) das Keyboard schließt.
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAnywhere:)];
    
    //Saerchbar
    self.categorySearchBar.tintColor = [UIColor lightGrayColor];
    
    //Tableview
    self.categoryTableView.separatorColor = [UIColor blackColor];

    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    
    // Anmeldung als Beobachter, wenn der Standard-Wagen geändert wurde
    [nc addObserver:self selector:@selector(defaultCarChanged:) name:@"defaultCarChanged" object:nil];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSArray *keys = [self.categoryService.guides allKeys];
    return [keys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *keys = [self.categoryService.guides allKeys];
    NSString *key = [keys objectAtIndex:section];
    NSArray *guidesOfCategory = [self.categoryService.guides objectForKey: key];
    
    return guidesOfCategory.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"standard"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"standard"];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    NSArray *keys = [self.categoryService.guides allKeys];
    NSString *key = [keys objectAtIndex:indexPath.section];
    NSArray *guidesOfCategory = [self.categoryService.guides objectForKey: key];
    Guide *guide = [guidesOfCategory objectAtIndex:indexPath.row];
    cell.textLabel.text = guide.name;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    NSArray *keys = [self.categoryService.guides allKeys];
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
    
    
    [sectionView addSubview:label];
    return sectionView;
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
[self tableView:tableView didSelectRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *keys = [self.categoryService.guides allKeys];
    NSString *key = [keys objectAtIndex:indexPath.section];
    NSArray *guides = [self.categoryService.guides objectForKey:key];
    
    GuideViewController *viewController = [[GuideViewController alloc] initWithGuide:[guides objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self.categoryService reduceGuidesWithSearchText: searchText];
    [self.categoryTableView reloadData];
}

/**
 * Schließt das Keyboard, wenn Suchen gedrückt wird.
 */
- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.categorySearchBar resignFirstResponder];
}

/**
 * Schließt das Keyboard.
 */
-(void)didTapAnywhere: (UITapGestureRecognizer*) recognizer {
    [self.categorySearchBar resignFirstResponder];
}

@end
