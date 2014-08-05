//
//  HomeTableViewController.m
//  Daylee
//
//  Created by Matt Kostelecky on 12/24/13.
//  Copyright (c) 2013 Matt Kostelecky. All rights reserved.
//
//
#import <QuartzCore/QuartzCore.h>
#import "HomeTableViewController.h"
#import "HomeTableViewCell.h"
#import "NSString+FontAwesome.h"
#import "SelectedHomeCellView.h"

@interface HomeTableViewController ()

@property int testIcons;
@property BOOL isSelected;
@property BOOL buttonSelected;
@property NSInteger currentCellHeight;
@property UIButton *closeButton;
@property NSIndexPath *currentPath;

@end

@implementation HomeTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _testIcons = 0;
        _isSelected = NO;
        _buttonSelected = NO;
        _currentCellHeight = -1;
    }
    return self;
}

- (void)viewDidLoad
{
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    [self.tableView setSeparatorColor:[UIColor clearColor]];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    //  [self.tableView setDelegate:self];
    self.currentCellHeight = -1;
    self.isSelected = NO;
    self.tableView.scrollEnabled = YES;
    
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
        if ([indexPath row] == self.currentCellHeight) {
            return  tableView.frame.size.height;
        }
        else return 60;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeTableViewCell *cell = [[HomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    UIView *indentBox = [[UIView alloc] initWithFrame:CGRectMake(72, 12, 320, 36)];
    indentBox.layer.borderColor = [UIColor blackColor].CGColor;
    indentBox.backgroundColor = [UIColor clearColor];
    indentBox.layer.borderWidth = 1;
    
    //UIView *myView = [[UIView alloc] init];
    cell.iconBox = [[UIView alloc] initWithFrame:CGRectMake(00, 0, 60, 60)];
    cell.activityLabel = [[UILabel alloc] initWithFrame:CGRectMake(72, 4, 240, 30)];
    cell.descriptorLabel = [[UILabel alloc] initWithFrame:CGRectMake(72, 26, 260, 30)];
    cell.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(cell.frame.size.width - 72, 12, 60, 36)];
    cell.iconLabel = [[UILabel alloc] initWithFrame:CGRectMake(14, 20, 30, 20)];
    cell.headerBox = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, 60)];
    cell.iconLabel.font = [UIFont fontWithName:kFontAwesomeFamilyName size:24];
    cell.iconLabel.textColor = [UIColor whiteColor];
    
    cell.activityLabel.font = [UIFont fontWithName:@"HelveticaNeue" size:18];
    cell.activityLabel.textColor = [UIColor whiteColor];
    cell.descriptorLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:14];
    cell.descriptorLabel.textColor = [UIColor whiteColor];
    cell.timeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:18];
    cell.timeLabel.textColor = [UIColor whiteColor];
    cell.timeLabel.textAlignment = NSTextAlignmentCenter;
    cell.iconLabel.textAlignment = NSTextAlignmentCenter;
    
    
    if(self.testIcons == 0){
        cell.iconBox.backgroundColor = [UIColor colorWithRed:.56 green:.27 blue:.68 alpha:1];
        cell.timeLabel.backgroundColor = [UIColor colorWithRed:.56 green:.27 blue:.68 alpha:1];
        cell.headerBox.backgroundColor = [UIColor colorWithRed:.61 green:.35 blue:.71 alpha:1];
        cell.activityLabel.text = @"Study Time";
        cell.descriptorLabel.text = @"Gonna school";
        cell.iconLabel.text = [NSString fontAwesomeIconStringForEnum:FAIconPencil];
        cell.timeLabel.text = @"12:00";
        self.testIcons = 1;
    } else if(self.testIcons == 1){
        cell.iconBox.backgroundColor = [UIColor colorWithRed:.95 green:.61 blue:.07 alpha:1];
        cell.timeLabel.backgroundColor = [UIColor colorWithRed:.95 green:.61 blue:.07 alpha:1];
        cell.headerBox.backgroundColor = [UIColor colorWithRed:.95 green:.77 blue:.06 alpha:1];
        cell.activityLabel.text = @"Work Time";
        cell.descriptorLabel.text = @"Gonna work";
        cell.iconLabel.text = [NSString fontAwesomeIconStringForEnum:FAIconBriefcase];
        cell.timeLabel.text = @"8:00";
        self.testIcons = 2;
    } else if(self.testIcons == 2){
        cell.iconBox.backgroundColor = [UIColor colorWithRed:.09 green:.63 blue:.52 alpha:1];
        cell.timeLabel.backgroundColor = [UIColor colorWithRed:.09 green:.63 blue:.52 alpha:1];
        cell.headerBox.backgroundColor = [UIColor colorWithRed:.10 green:.74 blue:.61 alpha:1];
        cell.activityLabel.text = @"Leisure Time";
        cell.descriptorLabel.text = @"Gonna chill";
        cell.iconLabel.text = [NSString fontAwesomeIconStringForEnum:FAIconHome];
        cell.timeLabel.text = @"9:00";
        self.testIcons = 0;
    }
    cell.backgroundColor = [UIColor colorWithRed:.2 green:.2 blue:.2 alpha:1];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.timeLabel.layer.cornerRadius = 3;
    cell.timeLabel.layer.masksToBounds = YES;
    [cell.contentView addSubview:cell.headerBox];
    [cell.contentView addSubview:cell.iconBox];
    [cell.contentView addSubview:cell.iconLabel];
    [cell.contentView addSubview:cell.activityLabel];
    [cell.contentView addSubview:cell.descriptorLabel];
    [cell.contentView addSubview:cell.timeLabel];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeTableViewCell *currentCell = (HomeTableViewCell*)[self.tableView cellForRowAtIndexPath:indexPath];
    currentCell.selectedView.indexPath = indexPath;
    NSInteger row = [indexPath row];
    if((indexPath == self.currentPath )&& (!self.buttonSelected)){
        return;
    }
    self.currentPath = indexPath;
    self.tableView = tableView;
    if(self.isSelected && self.currentCellHeight == row){
        currentCell.headerBox.backgroundColor = currentCell.headerBox.backgroundColor;
        currentCell.timeLabel.backgroundColor = currentCell.iconBox.backgroundColor;
        self.isSelected = NO;
        row = -1;
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [currentCell animateWhenDeselected];
        [self.closeButton removeFromSuperview];
        tableView.scrollEnabled = YES;
        currentCell.userInteractionEnabled = YES;
    }
    else {
        self.isSelected = YES;
        currentCell.headerBox.backgroundColor = currentCell.headerBox.backgroundColor;
        currentCell.timeLabel.backgroundColor = currentCell.iconBox.backgroundColor;
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        [currentCell animateWhenSelected];
        [currentCell.closeButton addTarget:self action:@selector(buttonWasPressed) forControlEvents:UIControlEventTouchUpInside];
        tableView.scrollEnabled = NO;
        currentCell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.buttonSelected = NO;
    }
    self.currentCellHeight = row;
    [tableView beginUpdates];
    [tableView endUpdates];
    [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    
}
- (void)buttonWasPressed{
    self.buttonSelected = YES;
    
    [self tableView:self.tableView didSelectRowAtIndexPath:self.currentPath];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
