//
//  NSString+EnkiUtils.m
//
//  Copyright (c) 2013 P i
//

#import "NSString+EnkiUtils.h"

@implementation NSString (EnkiUtils)

// from
// http://stackoverflow.com/questions/2753956/string-contains-string-in-objective-c
// Thanks P i!
//
- (BOOL) containsString: (NSString*) substring
{
    NSRange range = [self rangeOfString : substring];
    BOOL found = ( range.location != NSNotFound );
    return found;
}
@end
