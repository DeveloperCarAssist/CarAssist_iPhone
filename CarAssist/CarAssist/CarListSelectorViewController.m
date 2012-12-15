//
//  CarListSelectorViewController.m
//  CarAssist
//
//  Created by 0witt on 07.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "CarListSelectorViewController.h"
#import "Profile.h"
#import "Utils.h"

@interface CarListSelectorViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (nonatomic) Car* selectedCar;
@property BOOL firstStart;
@end

@implementation CarListSelectorViewController

- (id)initWithDelegate:(NSObject<CarListSelectorDelegate>*) delegate andFirstStart: (BOOL) firstStart
{
    self = [super init];
    if (self) {
        self.firstStart = firstStart;
        self.carListService = [[CarListService alloc] init];
        self.delegate = delegate;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if(self.firstStart)
    {
     //    self.navigationItem.hidesBackButton = YES;
    }
    self.title = @"Auto hinzufügen";
    
    UIBarButtonItem* saveButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action: @selector(saveCarButtonClicked)];
    [self.navigationItem setRightBarButtonItem: saveButton];
    
    
    // Hintergrundgrafik einbinden
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_profil_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    //Searchbar
    self.carSearchBar.tintColor = [UIColor lightGrayColor];
    
    //TableView
    self.carSelectionTableView.separatorColor = [UIColor blackColor];
    
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
    
    
    cell.textLabel.text = currentModel.model;
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];
        
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
        if ([[Profile getProfile].carList containsObject:self.selectedCar])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Auto schon vorhanden!" message:@"Das gewählte Auto ist bereits vorhanden, wählen Sie ein anderes." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        }
        else
        {
            [self.delegate carHasBeenSelected:self.selectedCar];
            [self.navigationController popViewControllerAnimated:YES];
        }
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
