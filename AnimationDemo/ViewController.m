//
//  ViewController.m
//  AnimationDemo
//
//  Created by Rachel Bobbins on 1/29/15.
//  Copyright (c) 2015 Rachel Bobbins. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Fold.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *animationContainer;
@property (strong) UIView *topHalfView;
@property (strong) UIView *bottomHalfView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Page Fold";
}

- (IBAction)didTapAnimate:(id)sender {
    [self.animationContainer foldOpenWithTransparency:NO withCompletionBlock:nil];
}

@end
