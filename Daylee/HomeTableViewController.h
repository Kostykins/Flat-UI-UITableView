//
//  HomeTableViewController.h
//  Daylee
//
//  Created by Matt Kostelecky on 12/24/13.
//  Copyright (c) 2013 Matt Kostelecky. All rights reserved.
//

#import <UIKit/UIKit.h> 
#import "HomeTableViewCell.h"

@protocol HomeCellDelegate
//- (void)animateWhenDeselected:(Home *)currentCell;
@end

@interface HomeTableViewController : UITableViewController <UITableViewDelegate, UITableViewDataSource>

@end
