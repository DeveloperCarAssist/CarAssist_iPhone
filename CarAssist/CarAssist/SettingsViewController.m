//
//  SettingsViewController.m
//  CarAssist
//
//  Created by 0fiedler on 07.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "SettingsViewController.h"
#import "CarFavoriteViewController.h"
#import "Profile.h"
#import "Utils.h"
#import "RoadsideAssistanceViewController.h"
#import "StartScreenViewController.h"

@interface SettingsViewController ()
@property Profile* profil;
@end

@implementation SettingsViewController



-(SettingsViewController*) init
{
    self = [super init];
    if (self) {
            self.profil = [Profile getProfile];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.navigationItem setTitle: @"Profil"];
    
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
    

    CarFavoriteViewController *carcontroller = [[CarFavoriteViewController alloc] init];
    [self.navigationController pushViewController:carcontroller animated:YES];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    
    int pos = indexPath.row;
    if (pos == 0) {
        cell.textLabel.text=@"Autos";
    }
    
    if (pos == 1) {
         cell.textLabel.text=@"Pannenservice";
    }
    if (pos == 2) {
       cell.textLabel.text=@"Werkstätten";
    }

    cell.backgroundColor = [UIColor clearColor];
    cell.backgroundView.backgroundColor = [UIColor clearColor];
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int pos = indexPath.row;
    if (pos == 0) {
        CarFavoriteViewController *carcontroller = [[CarFavoriteViewController alloc] init];
            [self.navigationController pushViewController:carcontroller animated:YES];
    }
    if (pos == 1) {
        RoadsideAssistanceViewController *adaccontroller = [[RoadsideAssistanceViewController alloc] init];
        [self.navigationController pushViewController:adaccontroller animated:YES];
    }
    if(pos == 2) {
        //Hier die Werkstättten Viewcontroller Pushen
    }
}

@end
