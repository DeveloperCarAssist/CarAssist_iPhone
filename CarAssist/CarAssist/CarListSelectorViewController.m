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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.carListService.cars allKeys].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSString* producer = [[self.carListService.cars allKeys] objectAtIndex:section];
    NSArray* modelsFromProducer = [self.carListService.cars objectForKey:producer];
    return modelsFromProducer.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"standard"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"standard"];
    }
        
    NSString* producer = [[self.carListService.cars allKeys] objectAtIndex:indexPath.section];
    NSArray* modelsFromProducer = [self.carListService.cars objectForKey:producer];
    Car* currentModel = [modelsFromProducer objectAtIndex:indexPath.row];
    
    cell.textLabel.text = currentModel.modell;
        
    return cell;
}

- (NSString *)tableView:(UITableView *)aTableView titleForHeaderInSection:(NSInteger)section {
    
    NSString* currentProducer = [[self.carListService.cars allKeys] objectAtIndex:section];
    return currentProducer;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSString* producer = [[self.carListService.cars allKeys] objectAtIndex:indexPath.section];
    NSArray* modelsFromProducer = [self.carListService.cars objectForKey:producer];
    Car* currentModel = [modelsFromProducer objectAtIndex:indexPath.row];
    self.selectedCar = currentModel;
    
}

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self.carListService reduceCarsWithSearchText: searchText];
    [self.carSelectionTableView reloadData];
}

/**
 * Diese Methode sorgt für das Speichern des ausgewählten Autos
 */
- (void) saveCarButtonClicked
{
    if (self.selectedCar) {
        [self.delegate carHasBeenSelected:self.selectedCar];
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Kein Auto gewählt!" message:@"Bitte wählen Sie ein Auto aus." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
    }
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
