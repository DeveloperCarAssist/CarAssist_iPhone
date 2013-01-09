//
//  RoadsideAssitanceViewController.m
//  CarAssist
//
//  Created by 0fiedler on 15.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "RoadsideAssitanceViewController.h"
#import "Profile.h"
#import "Utils.h"

@interface RoadsideAssitanceViewController ()
@property (nonatomic) Profile* profile;
@end

@implementation RoadsideAssitanceViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.profile= [Profile getProfile];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 6;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
    }
    if (indexPath.row == 0)
    {
        cell.textLabel.text=@"ADAC-Nummer";
        cell.detailTextLabel.text=self.profile.ADAClicence;
    }
    if(indexPath.row == 1)
    {
        cell.textLabel.text=@"Vorname";
        cell.detailTextLabel.text=self.profile.vorname;
    }
    if(indexPath.row == 2)
    {
        cell.textLabel.text=@"Nachname";
        cell.detailTextLabel.text=self.profile.nachname;
    }
    if(indexPath.row == 3)
    {
        cell.textLabel.text=@"Email-Adresse";
        cell.detailTextLabel.text=self.profile.emailAdresse;
    }
    if(indexPath.row == 4)
    {
        cell.textLabel.text=@"HandyNummer";
        cell.detailTextLabel.text= [NSString stringWithFormat:@"%d", self.profile.mobilenumber];
    }
    if(indexPath.row == 5)
    {
        cell.textLabel.text=@"Heimat Stadt";
        cell.detailTextLabel.text= self.profile.homeTown;
    }
    
      cell.detailTextLabel.textColor = [UIColor blackColor];
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
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
