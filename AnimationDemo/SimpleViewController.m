//
//  ViewController.m
//  AnimationDemo
//
//  Created by Rachel Bobbins on 1/29/15.
//  Copyright (c) 2015 Rachel Bobbins. All rights reserved.
//

#import "SimpleViewController.h"
#import "UIView+Fold.h"

@interface SimpleViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationContainer;
@property (strong) UIView *topHalfView;
@property (strong) UIView *bottomHalfView;
@end

@implementation SimpleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Simple View Fold";
}

- (IBAction)didTapAnimate:(id)sender {
    [self.animationContainer foldOpenWithTransparency:NO withCompletionBlock:nil];
}

@end
