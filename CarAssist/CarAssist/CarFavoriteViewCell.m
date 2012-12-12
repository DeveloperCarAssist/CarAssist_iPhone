//
//  CarFavoriteViewCell.m
//  CarAssist
//
//  Created by Dennis on 12.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "CarFavoriteViewCell.h"
@interface CarFavoriteViewCell ()
@property (nonatomic) UIImage *noFavoriteCarImage;
@property (nonatomic) UIImage *favoriteCarImage;
@property (nonatomic) UIImage *currentImage;
@end

@implementation CarFavoriteViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.noFavoriteCarImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"kein_favorit" ofType:@"png"]];
        self.favoriteCarImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"favorit" ofType:@"png"]];
        self.favoriteCarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.favoriteCarButton];
    }
    return self;
}
- (void) layoutSubviews
{
    [super layoutSubviews];
    CGFloat btnHeight = self.frame.size.height - 2.0f; // etwas kleiner damit die Rahmenlinien nicht überzeichnet werden
    self.favoriteCarButton.frame = CGRectMake(10.0f, 1.0f, btnHeight,btnHeight);
    self.textLabel.frame = CGRectMake(btnHeight + 10.0f, 0.0f, self.frame.size.width - btnHeight - 10.0f, btnHeight);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setFavorite:(BOOL)favorite
{
    _favorite = favorite;
    if(favorite) {
        self.currentImage = self.favoriteCarImage;
        self.textLabel.font = [UIFont boldSystemFontOfSize:16.0f];
    } else {
        self.currentImage = self.noFavoriteCarImage;
        self.textLabel.font = [UIFont systemFontOfSize:16.0f];
    }
    [self.favoriteCarButton setImage:self.currentImage forState:UIControlStateNormal];
}

@end
