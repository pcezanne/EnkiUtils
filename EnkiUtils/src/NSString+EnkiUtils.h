//
//  NSString+EnkiUtils.h
//
//  Copyright (c) 2013 P i
//

#import <Foundation/Foundation.h>


/**
 @author P i http://stackoverflow.com/questions/2753956/string-contains-string-in-objective-c
 
 The NSString category extends NSString to make it easy to see if a string contains a string.
 */


@interface NSString (EnkiUtils)

/** Return TRUE if the string contains a string. */
- (BOOL) containsString: (NSString*) substring;

@end
