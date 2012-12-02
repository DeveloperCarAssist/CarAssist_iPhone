//
//  ServiceCategoryViewController.m
//  CarAssist
//
//  Created by 0thuerin on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "ServiceCategoryViewController.h"
#import "ServiceGuideStockService.h"
#import "Guide.h"

@interface ServiceCategoryViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@end

@implementation ServiceCategoryViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.serviceGuideStockService = [[ServiceGuideStockService alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Service";
    
    // TapRecognizer, der bei jedem Tab auf unsere View (ausserhalb des Keyboards) das Keyboard schließt.
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAnywhere:)];
    [self.view addGestureRecognizer:tapRecognizer];
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
        
        NSArray *keys = [self.serviceGuideStockService.guides allKeys];
        NSString *key = [keys objectAtIndex:indexPath.section];
        NSArray *guidesOfCategory = [self.serviceGuideStockService.guides objectForKey: key];
        Guide *guide = [guidesOfCategory objectAtIndex:indexPath.row];
        cell.textLabel.text = guide.name;
    }
    
    return cell;
}

- (UITableViewCellAccessoryType)tableView:(UITableView *)tv accessoryTypeForRowWithIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellAccessoryDetailDisclosureButton;
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        // TODO: Ansicht eines einzelnen Guides erzeugen 
        //WarningLightCollectionViewController* viewController = [[WarningLightCollectionViewController alloc] init];
        //[self.navigationController pushViewController:viewController animated:YES];
    }
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
