//
//  NSMutableArray+EnkiUtils.m
//  EnkiUtilsFramework
//
//  Created by Paul Cezanne on 6/26/13.
//
//

#import "NSMutableArray+EnkiUtils.h"


// implementation by http://stackoverflow.com/questions/56648/whats-the-best-way-to-shuffle-an-nsmutablearray

@implementation NSMutableArray (EnkiUtils)


- (void)shuffle
{
    NSUInteger count = [self count];
    for (NSUInteger i = 0; i < count; ++i) {
        // Select a random element between i and end of array to swap with.
        NSInteger nElements = count - i;
        NSInteger n = (arc4random() % nElements) + i;
        [self exchangeObjectAtIndex:i withObjectAtIndex:n];
    }
}

@end
