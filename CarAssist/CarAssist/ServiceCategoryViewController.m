//
//  ServiceCategoryViewController.m
//  CarAssist
//
//  Created by 0thuerin on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "ServiceCategoryViewController.h"
#import "ServiceGuideStockService.h"
#import "GuideViewController.h"
#import "Guide.h"
#import "Profile.h"
#import "Car.h"
#import "Utils.h"

@interface ServiceCategoryViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@end

@implementation ServiceCategoryViewController


- (void)dealloc {
    // Abmeldung am notification center, wenn das Objekt selbst gelöscht wird
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// Nachricht defaultCarChanged behandeln
-(void)defaultCarChanged:(NSNotification *)notification
{
    Car *car = [notification.userInfo objectForKey:@"car"];
    self.serviceGuideStockService = [[ServiceGuideStockService alloc] initWithCar: car];
    [self.navigationController popToRootViewControllerAnimated:false];
    [self.serviceGuideTableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"Service";
    
    // Hintergrundgrafik einbinden
    self.serviceGuideTableView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_service"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    // Service mit dem Standardwagen des Profils initialisieren
    Car *car = [[Profile getProfile] car];
    self.serviceGuideStockService = [[ServiceGuideStockService alloc] initWithCar:car];
    
    // TapRecognizer, der bei jedem Tab auf unsere View (ausserhalb des Keyboards) das Keyboard schließt.
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAnywhere:)];

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
    NSArray *keys = [self.serviceGuideStockService.guides allKeys];
    return [keys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *keys = [self.serviceGuideStockService.guides allKeys];
    NSString *key = [keys objectAtIndex:section];
    NSArray *guidesOfCategory = [self.serviceGuideStockService.guides objectForKey: key];
    
    return guidesOfCategory.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"standard"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"standard"];
        cell.textLabel.textColor = [UIColor whiteColor];
    }
    NSArray *keys = [self.serviceGuideStockService.guides allKeys];
    NSString *key = [keys objectAtIndex:indexPath.section];
    NSArray *guidesOfCategory = [self.serviceGuideStockService.guides objectForKey: key];
    Guide *guide = [guidesOfCategory objectAtIndex:indexPath.row];
    cell.textLabel.text = guide.name;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    return cell;
}

/* Indexliste am Rand. Wird zunächst nicht benötigt.
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [self.serviceGuideStockService.guides allKeys];
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    // return sth
}
*/

- (NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section {
    NSArray *keys = [self.serviceGuideStockService.guides allKeys];
    NSString *key = [keys objectAtIndex:section];
    return key;
    
}
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
[self tableView:tableView didSelectRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *keys = [self.serviceGuideStockService.guides allKeys];
    NSString *key = [keys objectAtIndex:indexPath.section];
    NSArray *guides = [self.serviceGuideStockService.guides objectForKey:key];
    
    GuideViewController *viewController = [[GuideViewController alloc] initWithGuide:[guides objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self.serviceGuideStockService reduceServiceGuidesWithSearchText: searchText];
    [self.serviceGuideTableView reloadData];
}

/**
 * Schließt das Keyboard, wenn Suchen gedrückt wird.
 */
- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.serviceSearchBar resignFirstResponder];
}

/**
 * Schließt das Keyboard.
 */
-(void)didTapAnywhere: (UITapGestureRecognizer*) recognizer {
    [self.serviceSearchBar resignFirstResponder];
}

@end
