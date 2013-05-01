//
//  EnkiUnorderedController.h
//
//  Created by Paul Cezanne on 4/2/13.
//  Copyright (c) 2013 Enki Labs. All rights reserved.
//

#import <UIKit/UIKit.h>


/** this enum specifies the slide direction. */
typedef enum {
    kSlideUndefined = 0,
    kSlideUp = 1,
    kSlideDown = 2,
    kSlideLeft = 3,
    kSlideRight = 4,
} slideDirection;

/**
 @author Paul Cezanne  http://www.EnkiLabs.com
 
 The EnkiUnorderedController enables you to switch from one view controller to another and use any of the up, down, left or right slide animations. You  can either cover the current view controller, which lets you uncover it and come back to your previous one, or you can simply replace the view controller with a new one.
 
 There is NO cover stack. If you cover more than once you must only uncover once, to see the original view controller. (And actually, this isn't tested at all but it should behave like that.) TODO: fix this, us an NSArray
 
 Please see the sample project for an app that demonstrates how replace works.
 */
@interface EnkiUnorderedController : UIViewController

/** The property that contains the current view controller. This is the view controller that will be displayed if you cover and then uncover. */
@property (strong, nonatomic)  UIViewController *current;
/** The property that contains the last view controller that was used as a cover. */
@property (strong, nonatomic)  UIViewController *cover;

/** init the currently displayed view controller from its nib. The nib file name must be the same as the class name. */
- (void)initCurrentWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

/** Replace the current view controller with the target view controller using a direction slide animation. removeFromParentViewController is called on the current target view controller */
- (void) replaceViewController:(UIViewController *) target withDirection:(slideDirection) direction;

/** Cover the current view controller with the target view controller using a direction slide animation. If the current view controller is already covered, cover it again but the current cover is not preserved. */
- (void) coverViewController:(UIViewController *) target withDirection:(slideDirection) direction;

/** Slide the covering view controller away using direction, slide the current view controller in, also using direction. Call removeFromParentViewController on the cover and then set it to nil */
- (void) uncoverViewControllerwithDirection:(slideDirection) direction;

@end
