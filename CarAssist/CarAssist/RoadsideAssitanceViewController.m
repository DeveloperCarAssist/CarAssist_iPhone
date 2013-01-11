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

@interface RoadsideAssitanceViewController ()<UIAlertViewDelegate>
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
        cell.detailTextLabel.text= [NSString stringWithFormat:@"%lld", self.profile.mobilenumber];
    }
    if(indexPath.row == 5)
    {
        cell.textLabel.text=@"Heimat Stadt";
        cell.detailTextLabel.text= self.profile.homeTown;
    }
    
      cell.detailTextLabel.textColor = [UIColor blackColor];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* title;
   
    if (indexPath.row == 0)
    {
        title=@"ADAC-Nummer";
    }
    if(indexPath.row == 1)
    {
        title=@"Vorname";
    }
    if(indexPath.row == 2)
    {
       title=@"Nachname";
    }
    if(indexPath.row == 3)
    {
        title=@"Email-Adresse";
    }
    if(indexPath.row == 4)
    {
        title=@"HandyNummer";
    }
    if(indexPath.row == 5)
    {
        title=@"Heimat Stadt";
    }
    NSString* message = [NSString stringWithFormat: @"Bitte geben sie ihre(n) %@ ein", title];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"Abbrechen" otherButtonTitles:@"Ok", nil];
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alertView show];
}

- (void) alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        NSString* text = [alertView textFieldAtIndex:0].text;
        NSString* title = alertView.title;
        
        if ([title isEqualToString: @"ADAC-Nummer" ]) {
            self.profile.ADAClicence = text;
        }
        if ([title isEqualToString: @"Vorname"]) {
            self.profile.vorname=text;
        }
        if ([title isEqualToString: @"Nachname"]) {
            self.profile.nachname=text;
        }
        if ([title isEqualToString: @"Email-Adresse" ]) {
            self.profile.emailAdresse=text;
        }
        if ([title isEqualToString: @"HandyNummer" ]) {
            long long number = [text longLongValue];
            if( pow(10,(text.length-1)) > number )
            {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Handynummer Eingeben" message:@"Bitte geben sie eine Gültige Handynummer ein." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                
                [alertView show];
            }
            else{
            self.profile.mobilenumber=number;
        }
        }
        if ([title isEqualToString: @"Heimat Stadt" ]) {
            self.profile.homeTown=text;
        }
    }
     [self.tableView reloadData];
}
    -(void)viewWillAppear:(BOOL)animated
    {
        [self.tableView reloadData];        
    }

@end
