//
//  ServiceCategoryViewController.m
//  CarAssist
//
//  Created by 0thuerin on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "ServiceCategoryViewController.h"
#import "ServiceGuideStockService.h"
#import "Guide.h"

@interface ServiceCategoryViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation ServiceCategoryViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.serviceGuideStockService = [[ServiceGuideStockService alloc] init];
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSArray *keys = [self.serviceGuideStockService.guides allKeys];
    return [keys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *keys = [self.serviceGuideStockService.guides allKeys];
    NSString *key = [keys objectAtIndex:section];
    NSArray *guidesOfCategory = [self.serviceGuideStockService.guides objectForKey: key];
    
    return guidesOfCategory.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"standard"];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"standard"];
        
        NSArray *keys = [self.serviceGuideStockService.guides allKeys];
        NSString *key = [keys objectAtIndex:indexPath.section];
        NSArray *guidesOfCategory = [self.serviceGuideStockService.guides objectForKey: key];
        Guide *guide = [guidesOfCategory objectAtIndex:indexPath.row];
        cell.textLabel.text = guide.name;
    }
    
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
