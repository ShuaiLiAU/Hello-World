//
//  MidViewController.m
//  Assignment_Shuai Li
//
//  Created by Shuai Li on 17/5/17.
//  Copyright © 2017 Shuai Li. All rights reserved.
//

#import "MidViewController.h"
#import "StartViewController.h"
#import "ViewController.h"

@interface MidViewController ()

@end

@implementation MidViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self showEnter:3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

-(void)showEnter:(int)time
{
    self.showCount.text=[NSString stringWithFormat:@"%d", time];
    self.newtimer=[NSTimer scheduledTimerWithTimeInterval:1
                                                target:self
                                              selector:@selector(ticks)
                                              userInfo:nil
                                               repeats:YES];
}

- (void)ticks
{
    self.newlefttime=[self.showCount.text intValue];
    self.newlefttime--;
    self.showCount.text = [NSString stringWithFormat:@"%ld", self.newlefttime];
    if (self.newlefttime <= 0)
    {
        [self.newtimer invalidate];
        self.newtimer = nil;
        [self performSegueWithIdentifier:@"midView" sender:self];
        [self.view removeFromSuperview];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    StartViewController *start=(StartViewController*)self.presentingViewController;
    ViewController *second=segue.destinationViewController;
    second.showtime=[start.showtime.text intValue];
    second.showNumBubble=[start.showNumBubble.text intValue];
    second.name=start.nameInput.text;
}

@end
