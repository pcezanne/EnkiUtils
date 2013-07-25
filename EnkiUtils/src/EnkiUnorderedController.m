//
//  EnkiUnorderedController.m
//
//  Created by Paul Cezanne on 4/2/13.
//  Copyright (c) 2013 Enki Labs. All rights reserved.
//

#import "EnkiUnorderedController.h"

@interface EnkiUnorderedController ()
- (void) adjustTarget:(UIViewController *) vc withDirection:(slideDirection) direction;
- (void) slideCurrent:(UIViewController *) vc withDirection:(slideDirection) direction;
- (void) slideTarget:(UIViewController *) vc withDirection:(slideDirection) direction;

- (void) replaceViewController:(UIViewController *) target withDirection:(slideDirection)direction withCover:(BOOL) coverIt;

@end

@implementation EnkiUnorderedController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    self = [super initWithNibName:nil bundle:nibBundleOrNil];
    if (self) {
            // Custom initialization
    }
    return self;
}

- (void)initCurrentWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    Class vcClass = NSClassFromString (nibNameOrNil);
    self.current = [[vcClass alloc] initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self.current) {
        
        self.current.view.frame = self.view.frame;

        [self addChildViewController:self.current];
        [self.current didMoveToParentViewController:self];
        [self.view addSubview: self.current.view];
        
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

#pragma mark - Category methods


- (void) replaceViewController:(UIViewController *) target withDirection:(slideDirection) direction;
{
    [self replaceViewController:target withDirection:direction withCover:NO];
}

- (void) coverViewController:(UIViewController *) target withDirection:(slideDirection) direction;
{
    [self replaceViewController:target withDirection:direction withCover:YES];
}

- (void) uncoverViewControllerwithDirection:(slideDirection) direction;
{
    // knock the current off the screen to start with
    [self adjustTarget:_current withDirection:direction];
    
    [UIView animateWithDuration:0.5
                          delay:0
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         // slide the current one away
                         [self slideCurrent:_cover withDirection:direction];
                         
                         // slide the target in
                         [self slideTarget:_current withDirection:direction];
                     }
                     completion:^(BOOL finished){
                         [_cover.view removeFromSuperview];
                         [_cover willMoveToParentViewController:nil];
                         [_cover removeFromParentViewController];
                         _cover = nil;
                     }];
}

#pragma mark - Extension methods

/** replaceViewController is a private class extension that is used to perform the actual replacing or covering of the current view controller. Basically it makes the class more DRY. */ 
- (void) replaceViewController:(UIViewController *) target withDirection:(slideDirection)direction withCover:(BOOL) coverIt;
{
    target.view.frame = self.view.frame;
   
    // add the target as a child view controller.
    [self addChildViewController:target];
    [target didMoveToParentViewController:self];
    [self.view addSubview: target.view];

    // knock the target off the screen to start with
    [self adjustTarget:target withDirection:direction];
    
    [UIView animateWithDuration:0.5
                          delay:0
                        options: UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         // slide the current one away
                         [self slideCurrent:_current withDirection:direction];
                         
                         // slide the target in
                         [self slideTarget:target withDirection:direction];                         
                     }
                     completion:^(BOOL finished){
                         if (coverIt) {
                             if (_cover != nil) {
                                 [_cover.view removeFromSuperview];
                                 [_cover willMoveToParentViewController:nil];
                                 [_cover removeFromParentViewController];
                             }
                             _cover = target;
                         }else {
                             [_current.view removeFromSuperview];
                             [_current willMoveToParentViewController:nil];
                             [_current removeFromParentViewController];
                             _current = target;
                         }
                     }];
}

/** slideCurrent is a private class extension that manipulates the frame of the current view controller to perform the direction animation */
- (void) slideCurrent:(UIViewController *) vc withDirection:(slideDirection) direction;
{
    CGRect currentFrame = vc.view.frame;
    switch (direction) {
        case kSlideUp:
            currentFrame.origin.y -= currentFrame.size.height;
            break;
        case kSlideDown:
            currentFrame.origin.y += currentFrame.size.height;
            break;
        case kSlideLeft:
            currentFrame.origin.x -= currentFrame.size.width;
            break;
        case kSlideRight:
            currentFrame.origin.x += currentFrame.size.width;
            break;
            
        default:
            break;
    }
    vc.view.frame = currentFrame;

}

/** slideCurrent is a private class extension that manipulates the frame of the current view controller to perform the direction animation */
- (void) slideTarget:(UIViewController *) vc withDirection:(slideDirection) direction;
{
    CGRect targetFrame = vc.view.frame;
    switch (direction) {
        case kSlideUp:
            targetFrame.origin.y = 0;
            break;
        case kSlideDown:
            targetFrame.origin.y = 0;
            break;
        case kSlideLeft:
            targetFrame.origin.x = 0;
            break;
        case kSlideRight:
            targetFrame.origin.x = 0;
            break;
            
        default:
            break;
    }
    vc.view.frame = targetFrame;
    
}


/** adjustTarget is a private class extension that manipulates the frame of the passed view controller to perform the direction animation */
- (void) adjustTarget:(UIViewController *) vc withDirection:(slideDirection) direction;
{
    CGRect targetFrame = vc.view.frame;
    
    switch (direction) {
        case kSlideUp:
            targetFrame.origin.y += targetFrame.size.height;
            break;
        case kSlideDown:
            targetFrame.origin.y -= targetFrame.size.height;
            break;
        case kSlideLeft:
            targetFrame.origin.x += targetFrame.size.width;
            break;
        case kSlideRight:
            targetFrame.origin.x -= targetFrame.size.width;
            break;
            
        default:
            break;
    }
    vc.view.frame = targetFrame;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
