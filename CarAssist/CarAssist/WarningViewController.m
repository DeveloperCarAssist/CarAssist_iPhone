//
//  WarningViewController.m
//  CarAssist
//
//  Created by 0witt on 30.11.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "WarningViewController.h"
#import "WarningLightCollectionViewController.h"

@interface WarningViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation WarningViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    self.title = @"Störungen";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"standard"];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"standard"];
    }
    
    UIImage* warningLightCategoryImage = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"bremsanlage" ofType:@"png"]];
    
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
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        WarningLightCollectionViewController* viewController = [[WarningLightCollectionViewController alloc] init];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
