//
//  ServiceCategoryViewController.m
//  CarAssist
//
//  Created by 0thuerin on 02.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "CategoryViewController.h"
#import "GuideViewController.h"
#import "Guide.h"
#import "Car.h"
#import "SNPopupView.h"

@interface CategoryViewController () <UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate,SNPopupViewModalDelegate>
@property (nonatomic) SNPopupView *popup;
@end

@implementation CategoryViewController


- (void)dealloc {
    // Abmeldung am notification center, wenn das Objekt selbst gelöscht wird
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // TapRecognizer, der bei jedem Tab auf unsere View (ausserhalb des Keyboards) das Keyboard schließt.
    self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapAnywhere:)];
    
    //Saerchbar
    self.categorySearchBar.tintColor = [UIColor lightGrayColor];
    
    //Tableview
    self.categoryTableView.separatorColor = [UIColor blackColor];

    NSNotificationCenter* nc = [NSNotificationCenter defaultCenter];
    
    // Anmeldung als Beobachter, wenn der Standard-Wagen geändert wurde
    [nc addObserver:self selector:@selector(defaultCarChanged:) name:@"defaultCarChanged" object:nil];
    
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:
     UIKeyboardWillShowNotification object:nil];
    
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:
     UIKeyboardWillHideNotification object:nil];
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]
                                               initWithTarget:self
                                               action:@selector(handleLongPress:)];
    longPress.minimumPressDuration = 1.0;
    [self.view addGestureRecognizer:longPress];
}

-(void) keyboardWillShow:(NSNotification*) note
{
    [self.view addGestureRecognizer:self.tapRecognizer];
}

-(void) keyboardWillHide:(NSNotification*) note
{
    [self.view removeGestureRecognizer:self.tapRecognizer];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSArray *keys = [self.categoryService.items allKeys];
    return [keys count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *keys = [self.categoryService.items allKeys];
    NSString *key = [keys objectAtIndex:section];
    NSArray *guidesOfCategory = [self.categoryService.items objectForKey: key];
    
    return guidesOfCategory.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
     
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"standard"];
    UIImage* icon = [UIImage  imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"footstep_58x58" ofType:@"png"]];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:@"standard"];
        cell.textLabel.textColor = [UIColor blackColor];
    }
    NSArray *keys = [self.categoryService.items allKeys];
    NSString *key = [keys objectAtIndex:indexPath.section];
    NSArray *guidesOfCategory = [self.categoryService.items objectForKey: key];
    Guide *guide = [guidesOfCategory objectAtIndex:indexPath.row];
    cell.textLabel.text = guide.name;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    [cell.imageView setImage:icon];

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    NSArray *keys = [self.categoryService.items allKeys];
    NSString *key = [keys objectAtIndex:section];
    
    UIView *sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 22)];
    //!todo hier noch schöneren Hintergrund einbauen
    sectionView.backgroundColor = [UIColor lightGrayColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:sectionView.frame];
    label.textColor = [UIColor blackColor];
    label.backgroundColor = [UIColor clearColor];
    label.text = key;
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont boldSystemFontOfSize:18];
    
    
    [sectionView addSubview:label];
    return sectionView;
}


- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
[self tableView:tableView didSelectRowAtIndexPath:indexPath];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSArray *keys = [self.categoryService.items allKeys];
    NSString *key = [keys objectAtIndex:indexPath.section];
    NSArray *guides = [self.categoryService.items objectForKey:key];
    
    GuideViewController *viewController = [[GuideViewController alloc] initWithGuide:[guides objectAtIndex:indexPath.row]];
    [self.navigationController pushViewController:viewController animated:YES]; 
    
}
/**
 *Kümmert sich drum das beim Langklick der Popupview gezeigt wird und am ende wieder dismissed wird.
 */
-(void)handleLongPress:(UILongPressGestureRecognizer*)recognizer{
    if (recognizer.state == UIGestureRecognizerStateBegan){
    CGPoint location = [recognizer locationInView:self.view];
    
    if (CGRectContainsPoint([self.view convertRect:self.categoryTableView.frame fromView:self.categoryTableView.superview], location))
    {
        CGPoint locationInTableview = [self.categoryTableView convertPoint:location fromView:self.view];
        NSIndexPath *indexPath = [self.categoryTableView indexPathForRowAtPoint:locationInTableview];
        if (indexPath)
        {
    NSArray *keys = [self.categoryService.items allKeys];
    NSString *key = [keys objectAtIndex:indexPath.section];
    NSArray *guides = [self.categoryService.items objectForKey:key];
            Guide* guide =[guides objectAtIndex:indexPath.row];
    self.popup = [[SNPopupView alloc] initWithString: guide.name  withFontOfSize:15];
    [self.popup showAtPoint:location inView:self.view animated:YES];
    [self.popup addTarget:self action:@selector(didTouchPopupView:)];
    [self.popup setDelegate:self];
        }
    }
        
    }
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        [self.popup dismiss];
    }
}
- (void)didDismissModal:(SNPopupView*)popupview
{
    if (popupview == self.popup) {
		self.popup = nil;
	}
}

- (void) searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [self.categoryService reduceItemsWithSearchText: searchText];
    [self.categoryTableView reloadData];
}

/**
 * Schließt das Keyboard, wenn Suchen gedrückt wird.
 */
- (void) searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.categorySearchBar resignFirstResponder];
}

/**
 * Schließt das Keyboard.
 */
-(void)didTapAnywhere: (UITapGestureRecognizer*) recognizer {
    [self.categorySearchBar resignFirstResponder];
}

@end
