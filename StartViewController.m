//
//  StartViewController.m
//  Assignment_Shuai Li
//
//  Created by Shuai Li on 15/5/17.
//  Copyright © 2017 Shuai Li. All rights reserved.
//

#import "StartViewController.h"
#import "ViewController.h"
#import "EndViewController.h"
#import "MidViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController

@synthesize midNum;
@synthesize startButton;
@synthesize nameInput;
@synthesize test;
@synthesize showNumBubble;
@synthesize showtime;



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self settingSizeOfButtons];
    
    
    
    [self inputName];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)settingSizeOfButtons
{
    self.settingView.frame=CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 200);
    self.settingView.backgroundColor=[UIColor lightGrayColor];
    [self.view addSubview:self.settingView];
}

-(void)ifInputName
{
    if(self.nameInput.text.length!=0)
    {
        [startButton setEnabled:YES];
    }
    else [startButton setEnabled:NO];
}

-(void)inputName
{
    [startButton setEnabled:NO];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(ifInputName)
                                                 name:UITextFieldTextDidChangeNotification
                                               object:nameInput];
}

- (IBAction)startAction:(id)sender
{
      [self performSegueWithIdentifier:@"viewStart" sender:self];
}

- (IBAction)setting
{
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.8];
    CGPoint tempCen=self.settingView.center;
    if(self.settingView.frame.origin.y== self.view.frame.size.height)
    {
        tempCen.y-=self.settingView.bounds.size.height;
    }
    else
    {
        tempCen.y+=self.settingView.bounds.size.height;
    }
    self.settingView.center=tempCen;
    [UIView commitAnimations];
}

- (IBAction)dragBar:(UISlider *)sender
{
    showtime.text=[NSString stringWithFormat:@"%.f",sender.value];
}

- (IBAction)numBubble:(UISlider *)sender
{
    showNumBubble.text=[NSString stringWithFormat:@"%.f",sender.value];
}

@end
