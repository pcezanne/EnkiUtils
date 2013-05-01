//
//  MAWBaseViewController.m
//  Might As Well
//
//  Created by Paul Cezanne on 4/2/13.
//  Copyright (c) 2013 Enki Labs. All rights reserved.
//

#import "MAWBaseViewController.h"
#import "MAWAppDelegate.h"
#import "EnkiUnorderedController.h"

@interface MAWBaseViewController ()

@end

@implementation MAWBaseViewController

UIView *lazyMAWBaseViewControllerPreventer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIButton *replaceButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [replaceButton addTarget:self
               action:@selector(replace)
     forControlEvents:UIControlEventTouchUpInside];
    [replaceButton setTitle:@"Replace" forState:UIControlStateNormal];
    replaceButton.frame = CGRectMake(100, 100.0, 200.0, 200.0);
    [self.view addSubview:replaceButton];
    
    UIButton *pushButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [pushButton addTarget:self
               action:@selector(cover)
     forControlEvents:UIControlEventTouchUpInside];
    [pushButton setTitle:@"Cover" forState:UIControlStateNormal];
    pushButton.frame = CGRectMake(400, 100.0, 200.0, 200.0);
    [self.view addSubview:pushButton];
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
}

- (void) viewWillAppear:(BOOL)animated
{
    [[self navigationController] setNavigationBarHidden:YES animated:NO];
}

- (UIViewController *) randomVC
{
    int r = arc4random() % 5;
    r++;
    NSString *randomClassString = [NSString stringWithFormat:@"MAWJump%dViewController", r];
    Class vcClass = NSClassFromString (randomClassString);
    UIViewController *targetViewController = [[vcClass alloc] initWithNibName:randomClassString bundle:nil];
    
    // accessing the view property forces the view usual lazy evaluation to happen NOW
    lazyMAWBaseViewControllerPreventer = targetViewController.view;

    
    return targetViewController;
}

- (slideDirection) randomDirection
{
    int direction = arc4random() % 4;
    direction++;    // assumes implementation of slideDirection
    
    slideDirection theDirection = direction;
    
    return theDirection;
}


- (void)replace
{
    MAWAppDelegate  * appDelegate = (MAWAppDelegate *)[[UIApplication sharedApplication] delegate];
    EnkiUnorderedController *unVC = appDelegate.unorderedController;
    
    [unVC replaceViewController:[self randomVC] withDirection:[self randomDirection]];
}


- (void)cover
{
    MAWAppDelegate  * appDelegate = (MAWAppDelegate *)[[UIApplication sharedApplication] delegate];
    EnkiUnorderedController *unVC = appDelegate.unorderedController;
    
    [unVC coverViewController:[self randomVC] withDirection:[self randomDirection]];
}

#pragma mark - Boilerplate

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIDeviceOrientation)orientation {
    return ((orientation == UIDeviceOrientationLandscapeLeft)
            || (orientation == UIDeviceOrientationLandscapeRight)
            || (orientation == UIDeviceOrientationPortrait)
            || (orientation == UIDeviceOrientationPortraitUpsideDown)
            );
}


-(BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape | UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskPortraitUpsideDown
    ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
