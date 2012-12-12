//
//  CarFavoriteViewCell.h
//  CarAssist
//
//  Created by Dennis on 12.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CarFavoriteViewCell : UITableViewCell
@property (nonatomic) UIButton *favoriteCarButton;
@property (nonatomic) BOOL favorite;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
@end
