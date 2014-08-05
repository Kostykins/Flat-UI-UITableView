//
//  SelectedHomeCellView.m
//  Daylee
//
//  Created by Matt Kostelecky on 12/28/13.
//  Copyright (c) 2013 Matt Kostelecky. All rights reserved.
//

#import "SelectedHomeCellView.h"
#import "NSString+FontAwesome.h"


@implementation SelectedHomeCellView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    [self.mainColor setFill];
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.frame.size.width - 72, 12, 60, 64)  cornerRadius:3];
    UIBezierPath *buttonRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(self.frame.size.width - 72, 132, 60, (64 * 3)+24)  cornerRadius:3];
    UIBezierPath *remainingRect = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(12, 132, 222, (64 * 3)+24)  cornerRadius:3];
    //Button PlaceHolders
    UIBezierPath *sepLine2 = [UIBezierPath bezierPathWithRect:CGRectMake(15, 30, self.frame.size.width - 84, 1)];
    UIBezierPath *setForBackground = [UIBezierPath bezierPath];
    [setForBackground addArcWithCenter:CGPointMake(15, 15) radius:3 startAngle:M_PI/2 endAngle:0 clockwise:YES];
    [setForBackground moveToPoint:CGPointMake(15, 12)];
    [setForBackground addLineToPoint:CGPointMake(self.frame.size.width-160, 12)];
    [setForBackground addArcWithCenter:CGPointMake(self.frame.size.width-160, 15) radius:3 startAngle:M_PI/2 endAngle:0 clockwise:YES];
    [setForBackground addLineToPoint:CGPointMake(self.frame.size.width-157, 15)];
  //  [setForBackground moveToPoint:CGPointMake(self.frame.size.width-144, 15)];
    [setForBackground addLineToPoint:CGPointMake(self.frame.size.width-157, 31)];
    //[setForBackground addArcWithCenter:CGPointMake(self.frame.size.width-141, 15) radius:6 startAngle:0 endAngle:M_PI*.25 clockwise:YES];
    //[setForBackground moveToPoint:CGPointMake(self.frame.size.width-144, 12)];
    [setForBackground addLineToPoint:CGPointMake(15, 31)];
    [setForBackground addArcWithCenter:CGPointMake(15, 28) radius:3 startAngle:M_PI*1.5 endAngle:M_PI clockwise:YES];
    [setForBackground addLineToPoint:CGPointMake(12, 28)];
    [setForBackground addLineToPoint:CGPointMake(12, 15)];
    [roundedRect fill];
    [sepLine2 fill];
    [setForBackground fill];
    [self.secondaryColor setFill];
    UIBezierPath *sepLine = [UIBezierPath bezierPathWithRect:CGRectMake(self.frame.size.width - 72, 30, 60, 1)];
    UIBezierPath *sepLine3 = [UIBezierPath bezierPathWithRect:CGRectMake(31, 12, 1, 20)];
    [sepLine fill];
    [sepLine3 fill];
    UILabel *monthLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 70, 11, 56, 20)];
    UILabel *dayLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width - 70, 31, 56, 40)];
    UILabel *setForLabel = [[UILabel alloc] initWithFrame:CGRectMake(16, 12, self.frame.size.width - 158, 18)];
    UILabel *setForIcon = [[UILabel alloc] initWithFrame:CGRectMake(13, 12, 18, 19)];
    UITextView *timeSetLabel = [[UITextView alloc] initWithFrame:CGRectMake(10, 30, self.frame.size.width - 96, 240)];
    UIColor *remainingColor = [UIColor colorWithRed:0.17 green:0.17 blue:0.17 alpha:1];
    [remainingColor setFill];
    [remainingRect fill];
    monthLabel.text =@"JAN";
    monthLabel.textAlignment = NSTextAlignmentCenter;
    monthLabel.textColor = [UIColor whiteColor];
    monthLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    
    dayLabel.text =@"1";
    dayLabel.textAlignment = NSTextAlignmentCenter;
    dayLabel.textColor = [UIColor whiteColor];
    dayLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:32];
    
    setForLabel.text =@"EVENT INFORMATION";
    setForLabel.textAlignment = NSTextAlignmentCenter;
    setForLabel.textColor = [UIColor whiteColor];
    setForLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:12];
    
    setForIcon.font = [UIFont fontWithName:kFontAwesomeFamilyName size:12];
    setForIcon.textColor = [UIColor whiteColor];
    setForIcon.textAlignment = NSTextAlignmentCenter;
    setForIcon.text = [NSString fontAwesomeIconStringForEnum:FAIconInfoSign];
    /*setForLabel.backgroundColor = self.mainColor;
    setForLabel.layer.cornerRadius = 3;
    setForLabel.layer.masksToBounds = YES;*/
    
    timeSetLabel.text =@"Johnson has the reports. It is up to me to take the reports from Johnson. ";
    timeSetLabel.textAlignment = NSTextAlignmentLeft;
    timeSetLabel.textColor = [UIColor whiteColor];
    timeSetLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:16];
    timeSetLabel.backgroundColor = [UIColor clearColor];
    [timeSetLabel setUserInteractionEnabled:NO];
    
    [self addSubview:monthLabel];
    [self addSubview:dayLabel];
    [self addSubview:setForLabel];
    [self addSubview:setForIcon];
    [self addSubview:timeSetLabel];
    /* UIBezierPath *closeButton = [UIBezierPath bezierPathWithRect:CGRectMake(0, [UIScreen mainScreen].bounds.size.height - 180, self.frame.size.width, 60)];
    [closeButton fill];*/

    
}


@end
