//
//  HomeTableViewCell.m
//  Daylee
//
//  Created by Matt Kostelecky on 12/25/13.
//  Copyright (c) 2013 Matt Kostelecky. All rights reserved.
//

#import "HomeTableViewCell.h"
@interface HomeTableViewCell()

@end
@implementation HomeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)animateWhenSelected{
    self.closeButton = [[UIButton alloc] initWithFrame:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 126, self.frame.size.width, 60)];
    [self.closeButton setTitle:@"Close" forState:UIControlStateNormal];
    self.closeButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.closeButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:22];
    self.closeButton.backgroundColor = self.iconBox.backgroundColor;
    self.selectedView = [[SelectedHomeCellView alloc] initWithFrame:CGRectMake(0, 60, self.frame.size.width, [UIScreen mainScreen].bounds.size.height - 60)];
    self.selectedView.mainColor = self.iconBox.backgroundColor;
    self.selectedView.secondaryColor = self.backgroundColor;
    [self.contentView addSubview:self.selectedView];
    [self.contentView addSubview:self.closeButton];
    self.selectedView.alpha = 0;
    self.closeButton.alpha = 0;
    self.selectedView.currentCell = self;
    [UIView animateWithDuration:0.2
                          delay:0.2
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^ {
                         self.selectedView.alpha = 1;
                         self.closeButton.alpha = 1;
                     }
                     completion:nil];
    
}
- (void)animateWhenDeselected{
    //NSLog(@"SQUEELCH");
    self.closeButton.alpha = 0;
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^ {
                         self.selectedView.alpha = 0;
                     }
                     completion:^(BOOL finished){
                         if(finished){
                             [self.selectedView removeFromSuperview];
                             [self.closeButton removeFromSuperview];
                         }
                     }];
}

@end
