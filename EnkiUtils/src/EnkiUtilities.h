//
//  EnkiUtilities.h
//
//  Created by Paul Cezanne on 12/13/11.
//  Copyright (c) 2011-2013 Enki Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "UILabel+EnkiUtils.h"
#import "UIScreen+EnkiUtils.h"
#import "UIImage+EnkiUtils.h"
#import "NSString+EnkiUtils.h"
#import "UINavigationController+EnkiUtils.h"
#import "EnkiUnorderedController.h"


/*! \mainpage EnkiUtils
*
 * \section intro_sec Introduction
 *
 *  EnkiUtilities is a fairly vague collection of methods, classes, and class categories that I've developed over the years that I find personally useful when writing iOS apps. Feel free to use any or all of these in your apps.
 
 The categories, in particular, contain code that I've mostly not written, but rather found on line, mostly likely on stackoverflow and I've linked to the the authors when I can. I specifically do not claim copyright no them, they are not my work, just work that has been released into the wild for public consumption. (To be strictly legal, I should contact these authors for permission since they have not specified what licenese they've used, but that really seems like over kill for something that is short and published by the others for the purpose of reuse!

 *
 * \section install_sec Installation

 You can copy the source code into your Xcode project, or make a git sub-project. This is an ARC project so if you aren't using ARC you're going to need to add your release and auto-release calls.
 
 Be sure to look in the sampleCode folder for Xcode projects that use these utilities.
 *
 *
 * \section lic_sec License
 
 EnkiUtils is being distributed under the MIT License.
 
 Copyright (c) 2010-2013 Enki Labs, and other specified authors
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */


/**
 @author Paul Cezanne  http://www.EnkiLabs.com
 
 EnkiUtilities is a fairly vague collection of methods, classes, and class categories that I've developed over the years that I find personally useful when writing iOS apps. Feel free to use any or all of these in your apps.
 
 The categories, in particular, contain code that I've mostly not written, but rather found on line, mostly likely on stackoverflow and I've linked to the the authors when I can. I specifically do not claim copyright no them, they are not my work, just work that has been released into the wild for public consumption. (To be strictly legal, I should contact these authors for permission since they have not specified what licenese they've used, but that really seems like over kill for something that is short and published by the others for the purpose of reuse!
 
 Copyright (c) 2010-2013 Enki Labs, and other specified authors
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */


@interface EnkiUtilities : NSObject
{
    
}

/** Returns the background color of  tabbed group cell. This color changed between iOS4 and iOS5 */
+ (UIColor *)defaultBackgroundColor:(UITableViewCell *)inCell;
/** returns the number of pixels needed, multiplying by 2 for Retina displays. */
+ (float) pixelsForRetina:(float) pixels;
/**
 Returns TRUE if the two float numbers are almost equal. Be sure to read http://randomascii.wordpress.com/2012/02/25/comparing-floating-point-numbers-2012-edition/ This is a good algorightm for Enkid's applications, for many applications this is not at all good. Read and understand
 */
+(BOOL) AlmostEqualRelative:(float) A and:(float)B;

/** keyboardWasShown should be called from your keyboard Notification code to scroll the keyboard into view 
  @param  the notification object sent with the notification that the keyboard was raised
 @param view the view that the keyboard is being raised from
 @param the srollview that contains the table that the active field (and optionally, the active cell)
 @param the field that is being typed into
 @param the cell in the table that the field is in. May be nil
 */
+ (void)keyboardWasShown:(NSNotification*)aNotification
                    view:(UIViewController *) view 
              scrollView:(UITableView *)scrollView 
             activeField:(UIView *) activeField
              activeCell:(UITableViewCell *) activeCell;


@end

