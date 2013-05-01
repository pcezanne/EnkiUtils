//
//  UILabel+EkniUtils.h
//
//  Copyright (c) 2013 BadPirate
//

#import <UIKit/UIKit.h>


/**
 @author BadPirate http://stackoverflow.com/questions/406212/sizing-a-uilabel-to-fit
 
 The UILabel category extends UILabel so you can easily make a UILabel wrap multi-line text correctly.
 */

@interface UILabel (EkniUtils)

/** Resize a UILabel to correctly wrap the text to a width. Pass 0 if you want to wrap to the UILabel's frame width. Note, this is probably not what you want to do if you call it multiple times. Grab the original UILabel's width and stash it away somewhere or you'll find that your UILabel shrinks in width over time as you change the text. */
- (void)sizeToFitFixedWidth:(CGFloat)fixedWidth;

@end
