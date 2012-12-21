//
//  SettingsViewController.m
//  CarAssist
//
//  Created by 0fiedler on 07.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "SettingsViewController.h"
#import "CarFavoritViewController.h"
#import "Profile.h"
#import "Utils.h"
#import "RoadsideAssitanceViewController.h"

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
    

    CarFavoritViewController *carcontroller = [[CarFavoritViewController alloc] initWithProfil: self.profil];
    [self.navigationController pushViewController:carcontroller animated:YES];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    int pos = indexPath.row;
    if (pos == 0) {
        CarFavoritViewController *carcontroller = [[CarFavoritViewController alloc] initWithProfil: self.profil];
            [self.navigationController pushViewController:carcontroller animated:YES];
    }
    if (pos == 1) {
        RoadsideAssitanceViewController *adaccontroller = [[RoadsideAssitanceViewController alloc] init];
        [self.navigationController pushViewController:adaccontroller animated:YES];
    }
    if(pos == 2) {
        //Hier die Werkstättten Viewcontroller Pushen
    }
}

@end
