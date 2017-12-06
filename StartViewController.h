//
//  StartViewController.h
//  Assignment_Shuai Li
//
//  Created by Shuai Li on 15/5/17.
//  Copyright © 2017 Shuai Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StartViewController : UIViewController

- (IBAction)startAction:(id)sender;
- (IBAction)setting;
- (IBAction)dragBar:(UISlider *)sender;
- (IBAction)numBubble:(UISlider *)sender;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UITextField *nameInput;

@property (weak, nonatomic) IBOutlet UIView *settingView;
@property (strong, nonatomic) UIView *test;
@property (assign, nonatomic) NSInteger midNum;
@property (weak, nonatomic) IBOutlet UILabel *showtime;
@property (weak, nonatomic) IBOutlet UILabel *showNumBubble;

@end
