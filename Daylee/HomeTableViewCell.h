//
//  HomeTableViewCell.h
//  Daylee
//
//  Created by Matt Kostelecky on 12/25/13.
//  Copyright (c) 2013 Matt Kostelecky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectedHomeCellView.h"

@class SelectedHomeCellView;
@interface HomeTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *activityLabel;
@property (strong, nonatomic) UILabel *descriptorLabel;
@property (strong, nonatomic) UILabel *timeLabel;
@property (strong, nonatomic) UILabel *iconLabel;
@property (strong, nonatomic) UIView *iconBox;
@property (strong, nonatomic) UIView *headerBox;
@property SelectedHomeCellView *selectedView;

@property (strong, nonatomic) UIButton *closeButton;

- (void)animateWhenSelected;
- (void)animateWhenDeselected;
@end
