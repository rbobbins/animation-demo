//
//  UIView+Fold.h
//  AnimationDemo
//
//  Created by Rachel Bobbins on 1/31/15.
//  Copyright (c) 2015 Rachel Bobbins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Fold)

- (void)foldOpenWithTransparency:(BOOL)withTransparency
             withCompletionBlock:(void (^)(void))completionBlock;

- (void)foldClosedWithTransparency:(BOOL)withTransparency
             withCompletionBlock:(void (^)(void))completionBlock;
@end
