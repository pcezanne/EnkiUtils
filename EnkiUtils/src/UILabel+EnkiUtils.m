//
//  UILabel+EkniUtils.m
//
//  Copyright (c) 2013 BadPirate
//

#import "UILabel+EnkiUtils.h"

// Solution from http://stackoverflow.com/questions/406212/sizing-a-uilabel-to-fit
// thanks BadPirate
//

@implementation UILabel (EkniUtils)

- (void)sizeToFitFixedWidth:(CGFloat)fixedWidth
{
    if (fixedWidth < 0) {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 0);
    } else {
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, fixedWidth, 0);
    }
    self.lineBreakMode = UILineBreakModeWordWrap;
    self.numberOfLines = 0;
    [self sizeToFit];
}

@end
