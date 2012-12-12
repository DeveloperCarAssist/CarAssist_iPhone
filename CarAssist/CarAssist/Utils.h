//
//  Utils.h
//  CarAssist
//
//  Created by Dennis on 12.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utils : NSObject
// Skaliert ein Bild anhand der übergebenen Größe
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
@end
