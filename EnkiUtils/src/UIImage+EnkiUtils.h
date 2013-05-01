//
//  UIImage+EnkiUtils.h
//
//  portions Copyright (c) 2013 carlj.
//  portions Copyright (c) 2013 gcamp.
//

#import <UIKit/UIKit.h>


/**
 @author carlj https://gist.github.com/3782351
 @author gcamp http://stackoverflow.com/questions/2025319/scale-image-in-an-uibutton-to-aspectfit
 
The UIImage category allows for device specific image naming and proportional image scaling.
 */



@interface UIImage (EnkiUtils)

/** imageNamedForDevice returns the image named by -568@2x for
 4" retina devices. You use this in your app, not just for Default-568@2x. Odd ommission by apple... */
+ (UIImage*)imageNamedForDevice:(NSString*)name;
/** imageByScalingProportionallyToSize lets you resize an image so if, for example, you are butting it on a button, it is resized once, just everytime the button is rendered. */
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;


@end
