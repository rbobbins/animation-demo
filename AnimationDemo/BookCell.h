//
//  BookCell.h
//  AnimationDemo
//
//  Created by Rachel Bobbins on 1/31/15.
//  Copyright (c) 2015 Rachel Bobbins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *bookTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bookDescriptionLabel;
@property (weak, nonatomic) IBOutlet UIView *detailContainerView;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *detailContainerViewHeightConstraint;

@property (nonatomic, assign) BOOL withDetails;

- (void)animateOpen;
- (void)animateClosed;

@end
