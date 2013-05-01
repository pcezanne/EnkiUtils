//
//  UINavigationController+EnkiUtils.m
//
//  Copyright (c) 2013 Fry.
//

#import "UINavigationController+EnkiUtils.h"


// See http://stackoverflow.com/questions/12777474/ios-6-app-is-rotating-even-with-shouldautorotateno
// Thanks Fry!

@implementation UINavigationController (EnkiUtils)

-(BOOL)shouldAutorotate
{
    return [[self.viewControllers lastObject] shouldAutorotate];
}

-(NSUInteger)supportedInterfaceOrientations
{
    return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}

@end
