//
//  NSString+CarAssistString.m
//  CarAssist
//
//  Created by 0witt on 08.12.12.
//  Copyright (c) 2012 Gruppe Fear. All rights reserved.
//

#import "NSString+CarAssistString.h"

@implementation NSString (CarAssistString)

- (BOOL) containsSubstring: (NSString*) substring
{
    BOOL result = NO;
    if ([self rangeOfString:substring options:NSCaseInsensitiveSearch].location != NSNotFound) {
        result = YES;
    }
    return result;
}

@end
