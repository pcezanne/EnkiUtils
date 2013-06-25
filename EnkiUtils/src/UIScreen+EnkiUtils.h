//
//  UIScreen+EnkiUtils.h
//
//  Copyright (c) 2013 brian.clear
//

#import <UIKit/UIKit.h>

/**
 @author brian.clear http://stackoverflow.com/questions/5337924/ipad-2-detection
 
 The UIScreen category extends UIScreen so that we can tell if we are running on a Retina display or not.  
 */



@interface UIScreen (EnkiUtils)

/** Returns YES if this is a Retina display. */
- (BOOL)Enki_isRetina;
- (BOOL)Enki_isFourInch;

@end
