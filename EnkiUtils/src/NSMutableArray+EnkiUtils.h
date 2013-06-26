//
//  NSMutableArray+EnkiUtils.h
//  EnkiUtilsFramework
//
//  Created by Paul Cezanne on 6/26/13.
//
//

#import <UIKit/UIKit.h>

// implementation by http://stackoverflow.com/questions/56648/whats-the-best-way-to-shuffle-an-nsmutablearray


@interface NSMutableArray (EnkiUtils)

// This category enhances NSMutableArray by providing
// methods to randomly shuffle the elements.

- (void)shuffle;

@end
