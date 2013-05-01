//
//  MAWAppDelegate.h
//  Might As Well
//
//  Created by Paul Cezanne on 4/2/13.
//  Copyright (c) 2013 Enki Labs. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EnkiUnorderedController.h"

@interface MAWAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//@property (nonatomic, retain) UINavigationController *navigationController;
@property (nonatomic, retain) EnkiUnorderedController *unorderedController;

@end
