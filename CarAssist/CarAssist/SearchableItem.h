//
//  SearchableItem.h
//  CarAssist
//
//  Created by Dennis on 21.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SearchableItem <NSObject>
@required
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *categoryName;
@end
