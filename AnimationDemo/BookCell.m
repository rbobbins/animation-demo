//
//  BookCell.m
//  AnimationDemo
//
//  Created by Rachel Bobbins on 1/31/15.
//  Copyright (c) 2015 Rachel Bobbins. All rights reserved.
//

#import "BookCell.h"
#import "UIView+Fold.h"
@interface BookCell ()
@property (weak, nonatomic) IBOutlet UIView *titleContainer;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *detailContainerViewHeightConstraint;
@end

@implementation BookCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.withDetails = NO;
    self.backgroundView = nil;
    self.detailContainerViewHeightConstraint.constant = 0;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setWithDetails:(BOOL)withDetails {
    _withDetails = withDetails;
    
    if (withDetails) {
        self.detailContainerViewHeightConstraint.priority = 250;
    } else {
        self.detailContainerViewHeightConstraint.priority = 999;
    }
}

- (void)animateOpen {
    UIColor *originalBackgroundColor = self.contentView.backgroundColor;
    self.contentView.backgroundColor = [UIColor clearColor];
    [self.detailContainerView foldOpenWithTransparency:YES
                                   withCompletionBlock:^{
        self.contentView.backgroundColor = originalBackgroundColor;
    }];
}

- (void)animateClosed {
    UIColor *originalBackgroundColor = self.contentView.backgroundColor;
    self.contentView.backgroundColor = [UIColor clearColor];

    [self.detailContainerView foldClosedWithTransparency:YES withCompletionBlock:^{
        self.contentView.backgroundColor = originalBackgroundColor;
    }];
}



@end
