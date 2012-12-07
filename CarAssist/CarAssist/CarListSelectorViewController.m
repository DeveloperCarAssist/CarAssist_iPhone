//
//  CarListSelectorViewController.m
//  CarAssist
//
//  Created by 0witt on 07.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "CarListSelectorViewController.h"

@interface CarListSelectorViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic) Car* selectedCar;

@end

@implementation CarListSelectorViewController

- (id)initWithDelegate:(NSObject<CarListSelectorDelegate>*) delegate
{
    self = [super init];
    if (self) {
        self.carListService = [[CarListService alloc] init];
        self.delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Auto hinzufügen";
    
    UIBarButtonItem* saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action: @selector(saveCarButtonClicked)];
    [self.navigationItem setRightBarButtonItem: saveButton];
    
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.carListService giveAllProducer].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray* producers = [self.carListService giveAllProducer];
    NSArray* models = [self.carListService giveAllCarModels:[producers objectAtIndex: section]];
    
    return models.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"standard"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"standard"];
    }
    NSArray* producers = [self.carListService giveAllProducer];
    NSArray* models = [self.carListService giveAllCarModels:[producers objectAtIndex: indexPath.section]];
    Car* currentModel = [models objectAtIndex:indexPath.row];
    cell.textLabel.text = currentModel.modell;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section {
    NSArray* producers = [self.carListService giveAllProducer];
    NSString* currentProducer = [producers objectAtIndex:section];
    return currentProducer;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray* producers = [self.carListService giveAllProducer];
    NSArray* models = [self.carListService giveAllCarModels:[producers objectAtIndex: indexPath.section]];
    self.selectedCar = [models objectAtIndex:indexPath.row];
    
}

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
//    [self.serviceGuideStockService reduceServiceGuidesWithSearchText: searchText];
//    [self.serviceGuideTableView reloadData];
}

/**
 * Diese Methode sorgt für das Speichern des ausgewählten Autos
 */
- (void) carSaveButtonClicked
{
    
}

/**
 * Schließt das Keyboard, wenn Suchen gedrückt wird.
 */
- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.carSearchBar resignFirstResponder];
}

/**
 * Schließt das Keyboard.
 */
-(void)didTapAnywhere: (UITapGestureRecognizer*) recognizer {
    [self.carSearchBar resignFirstResponder];
}



@end
