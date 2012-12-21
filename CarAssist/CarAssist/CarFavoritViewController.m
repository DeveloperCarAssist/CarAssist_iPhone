//
//  CarFavoritViewController.m
//  CarAssist
//
//  Created by 0fiedler on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <MobileCoreServices/MobileCoreServices.h>
#import "CarFavoritViewController.h"
#import "CarListSelectorViewController.h"
#import "CarDataViewController.h"
#import "CarFavoriteViewCell.h"
#import "Utils.h"
#import "CarListService.h"

@interface CarFavoritViewController () <CarListSelectorDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (strong) Profile *profil;
@end

@implementation CarFavoritViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id) initWithProfil: (Profile*) profil 
{
    self = [super init];
    if (self) {
        self.profil = profil;
    }
    return self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem* addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action: @selector(addCarButtonClicked)];
    [self.navigationItem setRightBarButtonItem: addButton];
    [self.navigationItem setTitle: @"Profil"];
    
    //Tableview
    self.carFavoriteTableView.separatorColor = [UIColor blackColor];
    
    // Hintergrundgrafik einbinden
    // Das Zuschneiden des Bildes wird hier notwendig,
    // weil der BackgroundView desTableViews eine andere Größe
    // als der Screen selbst hat (in allen anderen Views gilt
    // Screengröße == Bildgröße)
    CGSize size = self.tableView.bounds.size;
    CGImageRef imageRef = CGImageCreateWithImageInRect([Utils imageWithImage:[UIImage imageNamed:@"background_profil_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size].CGImage, CGRectMake(0, 0,size.width, size.height));
    UIImage *img = [UIImage imageWithCGImage:imageRef];
    
    self.tableView.backgroundView = [[UIImageView alloc] initWithImage:img];
    self.tableView.separatorColor = [UIColor blackColor];

}

-(void)addCarButtonClicked
{
    UIActionSheet* sheet = [[UIActionSheet alloc]initWithTitle:@"Auto Hinzufügen" delegate: self cancelButtonTitle: @"Abbruch" destructiveButtonTitle: nil otherButtonTitles: @"Aus Liste wählen", @"Fahrgestellnummer eingeben", @"Fahrgestellnummer Scannen", nil ];
    
    [sheet showFromToolbar: self.navigationController.toolbar];

    
}
-(void) showCarSelectIfFirstStart
{
    if(!self.profil.car)
    {
        UIActionSheet* sheet = [[UIActionSheet alloc]initWithTitle:@"Auto auswählen" delegate: self cancelButtonTitle: nil destructiveButtonTitle: nil otherButtonTitles: @"Aus Liste wählen", @"Fahrgestellnummer eingeben", @"Fahrgestellnummer Scannen", nil ];
        [sheet showFromToolbar: self.navigationController.toolbar];
    }

}
-(void)viewWillAppear:(BOOL)animated
{
    [self.tableView reloadData];
    [self showCarSelectIfFirstStart];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return self.profil.carList.count;
}

// Ausgelöst vom Favoriten-Button...
-(void)changeDefaultCar:(id)sender event:(id)event
{
    // die dem Button zugeordnete Zelle und den Indexpath abfragen, dann
    // den Standardwagen setzen
    NSSet *touches = [event allTouches];
    UITouch *touch = [touches anyObject];
    CGPoint currentTouchPosition = [touch locationInView:self.carFavoriteTableView];
    NSIndexPath *indexPath = [self.carFavoriteTableView indexPathForRowAtPoint: currentTouchPosition];
    if (indexPath != nil)
    {
        Car *car = [self.profil.carList objectAtIndex: indexPath.row];
        self.profil.car = car;
        [self.carFavoriteTableView reloadData];
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    CarFavoriteViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CarFavoriteViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell.favoriteCarButton addTarget:self action:@selector(changeDefaultCar:event:) forControlEvents:UIControlEventTouchDown];
    }
  
    Car *car = [self.profil.carList objectAtIndex: indexPath.row];
    
    cell.favorite = (car == self.profil.car);
    cell.textLabel.text =  [NSString stringWithFormat:@" %@ - %@ ",car.model, car.owner ];
    cell.textLabel.textColor = [UIColor blackColor];
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    Car *car = [self.profil.carList objectAtIndex:indexPath.row];
    CarDataViewController *carprofilcontroller = [[CarDataViewController alloc] initWithCar: car];
     [self.navigationController pushViewController:carprofilcontroller animated:YES];
    
}

- (void)tableView:(UITableView *)tv commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        if([self.profil.carList objectAtIndex:indexPath.row] == self.profil.car)
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hinweis"
                                                            message:@"Sie können den als Favorit markierten Wagen nicht löschen."
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
        } else
        {
            [self.profil.carList removeObjectAtIndex:indexPath.row];
            [self.carFavoriteTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        }
    }
}

#pragma mark - Table view delegate
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{

    if (buttonIndex == 0)
    {
        CarListSelectorViewController* controller = [[CarListSelectorViewController alloc] initWithDelegate:self];
        [self.navigationController pushViewController:controller animated:YES];
    }
    
    if(buttonIndex == 1)
    {
        //Hier Fahrgestellnummer eigeben View Controller Pushen
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bitte Fahrgestellnummer Eingeben:"
                                                        message:nil
                                                       delegate:self
                                              cancelButtonTitle:@"Done"
                                              otherButtonTitles:nil];
        alert.alertViewStyle=UIAlertViewStylePlainTextInput;
        [alert show];
    }
    if(buttonIndex==2)
    {
        //Hier Fahrgestellnummer Scannen View Controller Pushen
        [self useCamera:self];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
  if([alertView.title isEqual: @"Bitte Fahrgestellnummer Eingeben:"])
  {
      UITextField *vin = [alertView textFieldAtIndex:0];
      CarListService *carListService = [[CarListService alloc] init];
     Car* car = [carListService returnCarByVehicalIdentNumber: vin.text];
      if(car)
      {
          if ([[Profile getProfile].carList containsObject:car])
          {
              UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Auto schon vorhanden!" message:@"Das gewählte Auto ist bereits vorhanden, wählen Sie ein anderes." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
              [alert show];
          }
          else
          {
          [self carHasBeenSelected: car];
          }
      }
      else
      {
          UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Achtung"
                                                          message:@"Nummer Leider nicht gefunden"
                                                         delegate:self
                                                cancelButtonTitle:@"OK"
                                                otherButtonTitles:nil];
                    [alert show];
      }
  }
}
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if([alertView.title isEqual: @"Achtung"]|[alertView.title isEqual: @"Auto schon vorhanden!"])
    {
        [self showCarSelectIfFirstStart];
    }
    if ([alertView.title isEqualToString:@"Keine Kamera vorhanden"]) {
        
        [self showCarSelectIfFirstStart];
    }
}

- (void) carHasBeenSelected:(Car *)selectedCar
{
    [self.profil.carList addObject:selectedCar];
    self.profil.car = selectedCar;
    [self.carFavoriteTableView reloadData];
}

-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        // In dieser Variable wird das fotographierte Bild gespeichert, allerdings wird es momentan nicht weiter verwendet!
//        UIImage* image = info[UIImagePickerControllerOriginalImage];
    }
    
    NSArray* carList = self.profil.carList;
    
    if (!(carList && carList.count)) {
        [self addCarButtonClicked];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void) useCamera:(id)sender
{
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        imagePicker.mediaTypes = @[(NSString *) kUTTypeImage];
        imagePicker.allowsEditing = NO;
        [self presentViewController:imagePicker
                           animated:YES completion:nil];
    }
    
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Keine Kamera vorhanden"
                                                        message:@"Die App benötigt Ihre Zustimmung zum Fotographieren der Fahrgestellnummer."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

@end
