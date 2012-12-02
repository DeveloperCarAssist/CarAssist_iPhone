//
//  ServiceCategoryViewController.m
//  CarAssist
//
//  Created by 0thuerin on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "ServiceCategoryViewController.h"

@interface ServiceCategoryViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ServiceCategoryViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Service";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // todo: dynamisch
    return 4;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"standard"];
    /*
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"standard"];
    }
    
    UIImage* warningLightCategoryImage = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"warnleuchtenKategorie" ofType:@"png"]];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Warnleuchten";
            
            [cell.imageView setImage:warningLightCategoryImage];
            break;
        case 1:
            cell.textLabel.text = @"Pannenhilfe";
            break;
        case 2:
            cell.textLabel.text = @"Vertragswerkstätten";
            break;
        case 3:
            cell.textLabel.text = @"Störung beheben";
            break;
        default:
            cell.textLabel.text = @"Einer zu viel :P";
            break;
    }
    ;
    */
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        //WarningLightCollectionViewController* viewController = [[WarningLightCollectionViewController alloc] init];
        //[self.navigationController pushViewController:viewController animated:YES];
    }
}



@end
