//
//  DayleeHomeViewController.m
//  Daylee
//
//  Created by Matt Kostelecky on 12/24/13.
//  Copyright (c) 2013 Matt Kostelecky. All rights reserved.
//
#import <QuartzCore/QuartzCore.h>
#import "DayleeHomeViewController.h"
#import "HomeTableViewController.h"

@interface DayleeHomeViewController ()

@property (weak, nonatomic) UIImageView *globalIcon;
@property (weak, nonatomic) UILabel *globalLabel;

@end

@implementation DayleeHomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    UIView *blackBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
    blackBar.backgroundColor = [UIColor colorWithRed:.2 green:.2 blue:.2 alpha:1];
    UIImageView *iconImage = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) - 36, (self.view.frame.size.height/2) - 48, 72, 72)];
    UILabel *helloLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width/3) - 20, (self.view.frame.size.height/2) + 10, 140, 50)];
    [helloLabel setText:@"Thank You : )"];
    [helloLabel setTextAlignment:NSTextAlignmentCenter];
    [helloLabel setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:24]];
    [helloLabel setTextColor:[UIColor blackColor]];
    [iconImage setImage:[UIImage imageNamed:@"dayleeIcon2.png"]];
    iconImage.backgroundColor = [UIColor clearColor];
    iconImage.alpha = 1;
    helloLabel.alpha = 1;
    self.globalIcon = iconImage;
    self.globalLabel = helloLabel;
    [self.view addSubview:self.globalIcon];
    [self.view addSubview:self.globalLabel];
    [self.view addSubview:blackBar];
    [self performSelector:@selector(createNavigationBar) withObject:self.view afterDelay:1];
    //[self createNavigationBar:iconImage text:helloLabel];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)createNavigationBar{
        [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^ {
                         self.globalIcon.alpha = 0;
                         self.globalLabel.alpha = 0;
                         self.view.backgroundColor = [UIColor colorWithRed:.3 green:.3 blue:.3 alpha:1];
                     }
                     completion:^(BOOL finished){
                         if(finished){
                             self.globalLabel.frame = CGRectMake(0, 30, self.view.frame.size.width-4, 32);
                             self.globalIcon.frame = CGRectMake(5, 22, 46, 46);
                             [self.globalLabel setText:@"Home"];
                             self.globalLabel.textColor = [UIColor whiteColor];
                             [self.globalLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:24]];
                            /* seperatorLine.layer.shadowColor = [UIColor blackColor].CGColor;
                             seperatorLine.layer.shadowOpacity = 0.5;
                             seperatorLine.layer.shadowOffset = CGSizeMake(1, 1);
                             seperatorLine.layer.shadowRadius = 2; */
                             [UIView animateWithDuration:0.3
                                                   delay:0.5
                                                 options:UIViewAnimationOptionCurveEaseInOut
                                              animations:^ {
                                                  self.globalIcon.alpha = 1;
                                                  self.globalLabel.alpha = 1;
                                              }
                                              completion:^(BOOL finished2){
                                                  [self createTableView];


                                              }];
                         }
                     }];
    
}
- (void)createTableView{
    HomeTableViewController *tableViewController = [[HomeTableViewController alloc] init];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0,0,320,[[UIScreen mainScreen] bounds].size.height-60) style:UITableViewStyleGrouped];
    UIView *viewForTable = [[UIView alloc]initWithFrame:CGRectMake(0,46,[[UIScreen mainScreen] bounds].size.width + 60,[[UIScreen mainScreen] bounds].size.height-60)];
    [tableViewController.view setBackgroundColor:[UIColor colorWithRed:.2 green:.2 blue:.2 alpha:1]];
    [tableView setDelegate:tableViewController];
    [tableView setDataSource:tableViewController];
    [self addChildViewController:tableViewController];
    [viewForTable addSubview:tableViewController.view];
    [self.view addSubview:viewForTable];
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
