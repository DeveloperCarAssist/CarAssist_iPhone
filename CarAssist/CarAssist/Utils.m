//
//  Utils.m
//  CarAssist
//
//  Created by Dennis on 12.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "Utils.h"

@implementation Utils
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
