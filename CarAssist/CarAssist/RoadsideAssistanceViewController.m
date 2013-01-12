//
//  RoadsideAssistanceViewController.m
//  CarAssist
//
//  Created by 0witt on 11.01.13.
//  Copyright (c) 2013 Gruppe Fear. All rights reserved.
//

#import "RoadsideAssistanceViewController.h"
#import "Profile.h"
#import "Utils.h"

@interface RoadsideAssistanceViewController () <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate>

@property (nonatomic) Profile* profile;

@end

@implementation RoadsideAssistanceViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.profile= [Profile getProfile];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Hintergrundgrafik einbinden
    self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[Utils imageWithImage:[UIImage imageNamed:@"background_stoerung_hell"] scaledToSize:[[UIScreen mainScreen] bounds].size]];
    
    //TableView
    self.roadsideAssistanceTableView.separatorColor = [UIColor blackColor];
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
    NSString* message;
    if (indexPath.row == 0)
    {
        title=@"ADAC-Nummer";
           message = [NSString stringWithFormat: @"Bitte geben sie ihre %@ ein", title];
    }
    if(indexPath.row == 1)
    {
        title=@"Vorname";
        message = [NSString stringWithFormat: @"Bitte geben sie ihren %@n ein", title];
    }
    if(indexPath.row == 2)
    {
        title=@"Nachname";
         message = [NSString stringWithFormat: @"Bitte geben sie ihren %@n ein", title];
    }
    if(indexPath.row == 3)
    {
        title=@"Email-Adresse";
         message = [NSString stringWithFormat: @"Bitte geben sie ihre %@ ein", title];
    }
    if(indexPath.row == 4)
    {
        title=@"HandyNummer";
         message = [NSString stringWithFormat: @"Bitte geben sie ihre %@ ein", title];
    }
    if(indexPath.row == 5)
    {
        title=@"Heimat Stadt";
         message = [NSString stringWithFormat: @"Bitte geben sie ihre %@ ein", title];
    }
 
    
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
    [self.roadsideAssistanceTableView reloadData];
}
-(void)viewWillAppear:(BOOL)animated
{
    [self.roadsideAssistanceTableView reloadData];
}


@end
