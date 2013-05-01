//
//  EnkiUtilities.m
//
//  Created by Paul Cezanne on 12/13/11.
//  Copyright (c) 2011-2103 Enki Labs. All rights reserved.
//

#import "EnkiUtilities.h"

@implementation EnkiUtilities


+ (float) pixelsForRetina:(float) pixels
{
    if ([[UIScreen mainScreen] Enki_isRetina]) {
        return pixels * 2;
    } else {
        return pixels;
    }
}

#pragma mark - numeric  methods

+(BOOL) AlmostEqualRelative:(float) A and:(float)B;
{
    float maxRelDiEnki = FLT_EPSILON;
    
    // Calculate the diEnkierence.
    float diEnki = fabs(A - B);
    A = fabs(A);
    B = fabs(B);
    // Find the largest
    float largest = (B > A) ? B : A;
    
    if (diEnki <= largest * maxRelDiEnki)
        return true;
    return false;
}


#pragma mark - Grouped TableCell  methods
static UIColor *EnkiUtiltiesBackgroundCellColor;

/** Note how we use the static UIColor object as a cache so we only have do some expensive operations once. */
+ (UIColor *)defaultBackgroundColor:(UITableViewCell *)inCell
{
    
    if (NULL == EnkiUtiltiesBackgroundCellColor) {
        // iOS 4 and iOS5 have diEnkierent color backgrounds for tabbed group dialogs
        // hence this gross hack. Must put it in a utility class someday.
        // see http://stackoverflow.com/questions/8405644/what-is-the-default-background-color-of-a-uitableviewstylegrouped-styled-uitable

        NSString *version = [[UIDevice currentDevice] systemVersion];
        NSString *firstLetter = [version substringToIndex:1]; 
        
        if ([firstLetter isEqual: @"4"]) {
            EnkiUtiltiesBackgroundCellColor = [UIColor whiteColor];
        } else {
            EnkiUtiltiesBackgroundCellColor = [UIColor colorWithRed:(0xF7/255.0)green:(0xF7/255.0)  blue:(0xF7/255.0) alpha:1.0];
        }
    }

    return EnkiUtiltiesBackgroundCellColor;
}


#pragma mark - keyboard methods


+ (void)keyboardWasShown:(NSNotification*)aNotification
                    view:(UIViewController *) view
              scrollView:(UIScrollView *)scrollView
             activeField:(UIView *) activeField
              activeCell:(UITableViewCell *) activeCell
{
    NSDictionary* info = [aNotification userInfo];
    CGRect rawKeyboardRect = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    CGRect properlyRotatedCoords = [view.view.window convertRect:rawKeyboardRect toView:view.view.window.rootViewController.view];
    
    CGSize kbSize = properlyRotatedCoords.size;
    
    
    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
    scrollView.contentInset = contentInsets;
    scrollView.scrollIndicatorInsets = contentInsets;
    
    CGRect viewRect = view.view.frame;
    
    if (nil != activeCell) {
        // If active text field is hidden by keyboard, scroll it so it's visible
        // Your application might not need or want this behavior.
        viewRect.size.height -= kbSize.height;
        
        CGPoint origin = activeCell.frame.origin;
        origin.x += activeField.frame.origin.x;
        origin.y += activeField.frame.origin.y;
        origin.y -= scrollView.contentOffset.y;
        
        if (!CGRectContainsPoint(viewRect, origin) ) {
            CGFloat scrollAmount = activeCell.frame.origin.y + activeField.frame.origin.y - 30;          // the -30 is just to make it look better
            CGPoint scrollPoint = CGPointMake(0.0, scrollAmount);
            
            [scrollView setContentOffset:scrollPoint animated:YES];
        }
    } else {
        
        CGRect fieldRect = activeField.frame;
        
        float distanceFromBottom = (viewRect.origin.y + viewRect.size.height) - (fieldRect.origin.y + fieldRect.size.height);
        float jumpNeeded = kbSize.height - distanceFromBottom;
        
        // the -30 is just to make it look better
        [scrollView setContentOffset:CGPointMake(0,jumpNeeded +30) animated:YES];
    }
    
}



@end

