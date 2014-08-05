//
//  DayleeStartViewController.m
//  Daylee
//
//  Created by Matt Kostelecky on 12/21/13.
//  Copyright (c) 2013 Matt Kostelecky. All rights reserved.
//

#import "DayleeStartViewController.h"
#import "DayleeHomeViewController.h"

@interface DayleeStartViewController ()

@property BOOL tutorialFlag;
//current textField that is first responder.
@property (strong, nonatomic) UITextField *currentField;
@property (strong, nonatomic) UIImageView *buttonView;

@end

@implementation DayleeStartViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _tutorialFlag = TRUE;
        _currentField = [[UITextField alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    UIImageView *iconImage = [[UIImageView alloc] initWithFrame:CGRectMake((self.view.frame.size.width/2) - 36, (self.view.frame.size.height/2) - 48, 72, 72)];
    UILabel *helloLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.view.frame.size.width/3) - 6, (self.view.frame.size.height/2) + 4, 120, 50)];
    [helloLabel setText:@"Hello!"];
    [helloLabel setTextAlignment:NSTextAlignmentCenter];
    [helloLabel setFont:[UIFont fontWithName:@"HelveticaNeue-UltraLight" size:32]];
    [helloLabel setTextColor:[UIColor blackColor]];
    //[helloLabel set]
    [helloLabel setBackgroundColor:[UIColor clearColor]];
    [iconImage setImage:[UIImage imageNamed:@"dayleeIcon2.png"]];
    iconImage.backgroundColor = [UIColor clearColor];
    [self.view addSubview:iconImage];
    [self.view addSubview:helloLabel];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    if(self.tutorialFlag == YES){
        [self tutorialModeStart:iconImage text:helloLabel];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tutorialModeStart:(UIImageView *)icon text:(UILabel *)textLabel{
    UITextView *tutorialInstructions = [[UITextView alloc] initWithFrame:CGRectMake(20, 96, self.view.frame.size.width - 40, self.view.frame.size.height - 100) textContainer:nil];
    UIImageView *confirmButton = [[UIImageView alloc] initWithFrame:CGRectMake(250, 240, 32, 32)];
    UIView *seperatorLine = [[UIView alloc] initWithFrame:CGRectMake(0, 70, 0, 2)];
    UIButton *nextButton = [[UIButton alloc] initWithFrame:CGRectMake(60, self.view.frame.size.height - 80, 200,60)];
    seperatorLine.alpha = 0;
    [seperatorLine setBackgroundColor:[UIColor darkGrayColor]];
    tutorialInstructions.backgroundColor = [UIColor clearColor];
    tutorialInstructions.alpha = 0;
    confirmButton.alpha = 0;
    [nextButton setTitle:@"Next" forState:UIControlStateNormal];
    [nextButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    nextButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:36];
    nextButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    nextButton.alpha = 0;
    [self.view addSubview:tutorialInstructions];
    [self.view addSubview:confirmButton];
    [self.view addSubview:seperatorLine];
    [self.view addSubview:nextButton];
    [UIView animateWithDuration:0.4
                          delay:0.8
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^ {
                         icon.alpha = 0;
                         textLabel.alpha = 0;
                     }
                     completion:^(BOOL finished){
                         if(finished){
                             icon.frame = CGRectMake(0, 26, 46, 46);
                             textLabel.frame = CGRectMake(36, 34, self.view.frame.size.width - 50, 32);
                             [textLabel setFont:[UIFont fontWithName:@"HelveticaNeue" size:16]];
                             [textLabel setText:@"Welcome to daylee, let's get started!"];
                             seperatorLine.alpha = 1;
                             [UIView animateWithDuration:0.4
                                                   delay:0.2
                                                 options:UIViewAnimationOptionCurveEaseInOut
                                              animations:^ {
                                                  [seperatorLine setFrame:CGRectMake(0, 70, self.view.frame.size.width, 2)];
                                                  icon.alpha = 1;
                                                  textLabel.alpha = 1;
                                              }
                                              completion:^(BOOL finished2){
                                                  if(finished2){
                                                      [tutorialInstructions setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:18]];
                                                      [tutorialInstructions setText:@"This is a tutorial page that will help you set up everything you need to start using daylee!\n\n First, Type in your name:\n\n\n\n\nThis name will only be used by Daylee for reference, it is saved locally on your phone."];
                                                      [tutorialInstructions setTextAlignment:NSTextAlignmentCenter];
                                                      [tutorialInstructions setUserInteractionEnabled:NO];
                                                      UITextField *nameField = [[UITextField alloc]initWithFrame:CGRectMake(40, 240, 240, 32)];
                                                      nameField.borderStyle = UITextBorderStyleLine;
                                                      nameField.textColor = [UIColor blackColor];
                                                      [nameField setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:16]];
                                                      [nameField setPlaceholder:@"name"];
                                                      [nameField setAutocorrectionType:UITextAutocorrectionTypeNo];
                                                      [nameField setDelegate:self];
                                                      [self.view addSubview:nameField];
                                                      nameField.alpha = 0;
                                                      [UIView animateWithDuration:0.4
                                                                            delay:0.5
                                                                          options:UIViewAnimationOptionCurveEaseInOut
                                                                       animations:^ {
                                                                           tutorialInstructions.alpha = 1;
                                                                           nameField.alpha = 1;
                                                                           confirmButton.alpha = 1;
                                                                           nextButton.alpha = 1;
                                                                       }
                                                                       completion:^(BOOL finished3){
                                                                           self.currentField = nameField;
                                                                           self.buttonView = confirmButton;
                                                                           [self.buttonView setImage:[UIImage imageNamed:@"problemButton.png"]];
                                                                           [nextButton addTarget:self action:@selector(doTheNeedfull) forControlEvents:UIControlEventTouchUpInside];
                                                                           [nextButton addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
                                                                           
                                                                       }];
                                                  }
                                              }];
                         }}];

}
- (void)buttonPressed:(UIButton *)currentButton{
    currentButton.alpha = .5;
    [UIView animateWithDuration:0.5
                          delay:0.5
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^ {
                         currentButton.alpha = 1;
                     }
                     completion:nil];

}
- (void)doTheNeedfull{
    UIView *swipeView = [[UIView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 - 28, 0, 60)];
    UILabel *confirmationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2 - 18, self.view.frame.size.width, 40)];
    [confirmationLabel setText:@"Error: Please enter a name."];
    [confirmationLabel setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:22]];
    [confirmationLabel setBackgroundColor:[UIColor clearColor]];
    [confirmationLabel setTextAlignment:NSTextAlignmentCenter];
    [confirmationLabel setTextColor:[UIColor whiteColor]];
    [swipeView setBackgroundColor:[UIColor colorWithRed:.7 green:.15 blue:.15 alpha:1]];
    //swipeView.alpha = .9;
    confirmationLabel.alpha = 0;
    [self.view addSubview:swipeView];
    [self.view addSubview:confirmationLabel];
    if(self.buttonView.image == [UIImage imageNamed:@"problemButton.png"]){
        [UIView animateWithDuration:0.3
                              delay:0.0
                            options:UIViewAnimationOptionCurveEaseInOut
                         animations:^ {
                             swipeView.frame = CGRectMake(0, self.view.frame.size.height/2 - 28, self.view.frame.size.width, 60);
                         }
                         completion:^(BOOL finished){
                             if(finished){
                                 [UIView animateWithDuration:0.3
                                                       delay:0.0
                                                     options:UIViewAnimationOptionCurveEaseInOut
                                                  animations:^ {
                                                      confirmationLabel.alpha = 1;
                                                      [swipeView setBackgroundColor:[UIColor colorWithRed:.7 green:.15 blue:.15 alpha:1]];
                                                  }
                                                  completion:^(BOOL finished2){
                                                      if(finished2){
                                                          [UIView animateWithDuration:0.3
                                                                                delay:1.5
                                                                              options:UIViewAnimationOptionCurveEaseInOut
                                                                           animations:^ {
                                                                               confirmationLabel.alpha = 0;
                                                                               swipeView.frame = CGRectMake(self.view.frame.size.width, self.view.frame.size.height/2 - 28, self.view.frame.size.width, 60);
                                                                           }
                                                                           completion:^(BOOL finished3){
                                                                               if(finished3){
                                                                                   [swipeView removeFromSuperview];
                                                                                   [confirmationLabel removeFromSuperview];
                                                                                   
                                                                               }
                                                                           }];
                                                      }}];
                             }
                         }];
    } else {
        DayleeHomeViewController *homeViewController = [[DayleeHomeViewController alloc] init];
        [homeViewController setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
        [self presentViewController:homeViewController animated:YES completion:nil];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^ {
                         self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y + 20, self.view.frame.size.width, self.view.frame.size.height);
                     }
                     completion:nil];

    if(textField.text.length > 0){
        [self.buttonView setImage:[UIImage imageNamed:@"confirmButton.png"]];
    }
    else{
        [self.buttonView setImage:[UIImage imageNamed:@"problemButton.png"]];
    }

}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if(textField.text.length+1 > 0){
        [self.buttonView setImage:[UIImage imageNamed:@"confirmButton.png"]];
    }
    else{
        [self.buttonView setImage:[UIImage imageNamed:@"problemButton.png"]];
    }
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^ {
                         self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y -20, self.view.frame.size.width, self.view.frame.size.height);
                     }
                     completion:nil];
    if(textField.text.length > 0){
        [self.buttonView setImage:[UIImage imageNamed:@"confirmButton.png"]];
    }
    else{
        [self.buttonView setImage:[UIImage imageNamed:@"problemButton.png"]];
    }
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(self.currentField.isFirstResponder){
        [self textFieldShouldReturn:self.currentField];
    }
}
@end
