//
//  UIScreen+EnkiUtils.m
//
//  Copyright (c) 2013 brian.clear
//

#import "UIScreen+EnkiUtils.h"

@implementation UIScreen (EnkiUtils)

// from http://stackoverflow.com/questions/5337924/ipad-2-detection
// thanks brian.clear

- (BOOL)Enki_isRetina {
    return [self respondsToSelector:@selector(displayLinkWithTarget:selector:)] && (self.scale == 2.0);
}

@end
