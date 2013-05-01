//
//  UINavigationController+EnkiUtils.h
//
//  Copyright (c) 2013 Fry.
//

#import <UIKit/UIKit.h>

/**
 @author Fry http://stackoverflow.com/questions/12777474/ios-6-app-is-rotating-even-with-shouldautorotateno
 
The UINavigationController category brings the iOS5 auto-rotation methodology to iOS6 apps. You do not need to do anything special to make this happen, just code your app as you would code an iOS5 app.
 
 Indeed, if you are using EnkiUtilities and want the iOS6 autorotation behavior you should comment out the implementations.
 */


@interface UINavigationController (EnkiUtils)
;
-(BOOL)shouldAutorotate;
-(NSUInteger)supportedInterfaceOrientations;
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation;

@end
