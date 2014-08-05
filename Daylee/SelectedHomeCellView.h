//
//  SelectedHomeCellView.h
//  Daylee
//
//  Created by Matt Kostelecky on 12/28/13.
//  Copyright (c) 2013 Matt Kostelecky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeTableViewCell.h"


@class HomeTableViewCell;
@interface SelectedHomeCellView : UIView 

@property (strong, nonatomic) UIColor *mainColor;
@property (strong, nonatomic) UIColor *secondaryColor;
@property (strong, nonatomic) UIButton *closeButton;
@property HomeTableViewCell *currentCell;
@property NSIndexPath *indexPath;

@end
