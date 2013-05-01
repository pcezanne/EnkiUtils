//
//  UIImage+EnkiUtils.m
//
//  portions Copyright (c) 2013 carlj.
//  portions Copyright (c) 2013 gcamp.
//

#import "UIImage+EnkiUtils.h"

@implementation UIImage (EnkiUtils)

// https://gist.github.com/3782351
// thanks carlj

+ (UIImage*)imageNamedForDevice:(NSString*)name {
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
    {
        if (([UIScreen mainScreen].bounds.size.height * [UIScreen mainScreen].scale) >= 1136.0f)
        {
            //Check if is there a path extension or not
            if (name.pathExtension.length) {
                name = [name stringByReplacingOccurrencesOfString: [NSString stringWithFormat:@".%@", name.pathExtension]
                                                       withString: [NSString stringWithFormat:@"-568h@2x.%@", name.pathExtension ] ];
                
            } else {
                name = [name stringByAppendingString:@"-568h@2x"];
            }
            
            //load the image e.g from disk or cache
            UIImage *image = [UIImage imageNamed: name ];
            if (image) {
                //strange Bug in iOS, the image name have a "@2x" but the scale isn't 2.0f
                return [UIImage imageWithCGImage: image.CGImage scale:2.0f orientation:image.imageOrientation];
            }
            
        }
    }
    
    return [UIImage imageNamed: name ];
    
}

// See http://stackoverflow.com/questions/2025319/scale-image-in-an-uibutton-to-aspectfit,
// Thanks gcamp
//
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize
{
    
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    
    CGSize imageSize = sourceImage.size;
    CGFloat width = imageSize.width;
    CGFloat height = imageSize.height;
    
    CGFloat targetWidth = targetSize.width;
    CGFloat targetHeight = targetSize.height;
    
    CGFloat scaleFactor = 0.0;
    CGFloat scaledWidth = targetWidth;
    CGFloat scaledHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (!CGSizeEqualToSize(imageSize, targetSize)) {
        
        CGFloat widthFactor = targetWidth / width;
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor < heightFactor)
            scaleFactor = widthFactor;
        else
            scaleFactor = heightFactor;
        
        scaledWidth  = width * scaleFactor;
        scaledHeight = height * scaleFactor;
        
        // center the image
        
        if (widthFactor < heightFactor) {
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
        } else if (widthFactor > heightFactor) {
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
        }
    }
    
    
    // this is actually the interesting part:
    
    UIGraphicsBeginImageContext(targetSize);
    
    CGRect thumbnailRect = CGRectZero;
    thumbnailRect.origin = thumbnailPoint;
    thumbnailRect.size.width  = scaledWidth;
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    if(newImage == nil) {
      NSLog(@"could not scale image");  
    }
    
    return newImage ;
}


@end
