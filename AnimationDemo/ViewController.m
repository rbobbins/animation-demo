//
//  ViewController.m
//  AnimationDemo
//
//  Created by Rachel Bobbins on 1/29/15.
//  Copyright (c) 2015 Rachel Bobbins. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationContainer;
@property (strong) UIView *topHalfView;
@property (strong) UIView *bottomHalfView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareSplitImage];

}
- (IBAction)didTapAnimate:(id)sender {
    [self prepareSplitImage];

    CATransform3D startingTransform = CATransform3DIdentity;
    startingTransform.m34 = -1 / 500.f;
    
    CGRect startingFrame = CGRectMake(0,
                                      -self.topHalfView.frame.size.height / 2,
                                      self.topHalfView.frame.size.width,
                                      self.topHalfView.frame.size.height);
    self.topHalfView.frame = startingFrame;
    self.bottomHalfView.frame = startingFrame;
    
    CGRect endingTopFrame = CGRectMake(0,
                                       0,
                                       self.topHalfView.frame.size.width,
                                       self.topHalfView.frame.size.height);
    CGRect endingBottomFrame = CGRectMake(0,
                                          CGRectGetMaxY(endingTopFrame),
                                          self.bottomHalfView.frame.size.width,
                                          self.bottomHalfView.frame.size.height);

    
    self.topHalfView.layer.anchorPoint = CGPointMake(0.5, 0.0);
    self.bottomHalfView.layer.anchorPoint = CGPointMake(0.5, 1.0);
    
    self.topHalfView.layer.transform = startingTransform;
    self.bottomHalfView.layer.transform = startingTransform;

    [CATransaction begin];
    [CATransaction setAnimationDuration:10.0];
    [CATransaction setCompletionBlock:^{
        self.topHalfView.frame = endingTopFrame;
        self.bottomHalfView.frame = endingBottomFrame;
    }];
    
    CABasicAnimation *topRotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    topRotationAnimation.fromValue = @(-M_PI_2);
    topRotationAnimation.toValue = @0;
    topRotationAnimation.fillMode = kCAFillModeForwards;
    [self.topHalfView.layer addAnimation:topRotationAnimation forKey:nil];
    
    
    CABasicAnimation *bottomRotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    bottomRotationAnimation.fromValue = @(M_PI_2);
    bottomRotationAnimation.toValue = @0;
    bottomRotationAnimation.fillMode = kCAFillModeForwards;
    [self.bottomHalfView.layer addAnimation:bottomRotationAnimation forKey:nil];
    
    CABasicAnimation *bottomTranslationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
    bottomTranslationAnimation.fromValue = @(0);
    bottomTranslationAnimation.toValue = @(2 * self.bottomHalfView.frame.size.height);
    bottomTranslationAnimation.fillMode = kCAFillModeForwards;
    
    //TODO: figure out a more precise timing function
    CAMediaTimingFunction *timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    timingFunction = [CAMediaTimingFunction functionWithControlPoints:0.005 :0.0 :0.58 :1.0];
    bottomTranslationAnimation.timingFunction = timingFunction;
    [self.bottomHalfView.layer addAnimation:bottomTranslationAnimation forKey:nil];
    [CATransaction commit];
    
}

- (void)prepareSplitImage {
    UIImage *image = [UIImage imageNamed:@"selfie.jpg"];
    CGRect imageFrame = CGRectMake(self.animationContainer.frame.origin.x,
                                               self.animationContainer.frame.origin.y,
                                               MIN(image.size.width, self.view.frame.size.width),
                                               MIN(image.size.height, self.view.frame.size.height));
    self.animationContainer.frame = imageFrame;
    
    UIGraphicsBeginImageContext(image.size);
    CGRect topImageFrame = CGRectMake(0, 0, imageFrame.size.width, imageFrame.size.height / 2);
    CGImageRef imageRef = CGImageCreateWithImageInRect(image.CGImage, topImageFrame);
    UIImage *topHalf = [UIImage imageWithCGImage:imageRef];
    
    CGRect bottomImageFrame = CGRectMake(0,
                                         CGRectGetMaxY(topImageFrame),
                                         imageFrame.size.width,
                                         imageFrame.size.height / 2);
    
    imageRef = CGImageCreateWithImageInRect(image.CGImage, bottomImageFrame);
    UIImage *bottomHalf = [UIImage imageWithCGImage:imageRef];
    CGImageRelease(imageRef);
    UIGraphicsEndImageContext();
    
    UIImageView *topHalfView = [[UIImageView alloc] initWithImage:topHalf];
    topHalfView.frame = topImageFrame;
    
    UIImageView *bottomHalfView = [[UIImageView alloc] initWithImage:bottomHalf];
    bottomHalfView.frame = bottomImageFrame;
    
    [self.animationContainer.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    [self.animationContainer addSubview:topHalfView];
    [self.animationContainer addSubview:bottomHalfView];
    
    self.topHalfView = topHalfView;
    self.bottomHalfView = bottomHalfView;
}

@end
