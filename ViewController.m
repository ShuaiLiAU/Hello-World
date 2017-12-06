
//
//  ViewController.m
//  Assignment_Shuai Li
//
//  Created by Shuai Li on 13/5/17.
//  Copyright © 2017 Shuai Li. All rights reserved.
//

#import "ViewController.h"
#import "StartViewController.h"
#import "EndViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UIButton *bubble;
UIButton *newBubble;
UIButton *old;
NSMutableArray* a;
CGFloat getHighScore=0;
CGFloat scoreOld=0;
CGFloat scoreHigh=0;
CGFloat score=0.0;
@synthesize showtime;
@synthesize showNumBubble;
@synthesize name;
@synthesize scoreDisplay;

- (void)viewDidLoad
{
    old=[[UIButton alloc]init];
    [super viewDidLoad];
    a=[[NSMutableArray alloc]init];
    [self addBubbleIntoArray:showNumBubble];
    [self showTime:showtime];
    self.displayHighScore.text=[NSString stringWithFormat:@"%.1f", [self getHighScore]];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EndViewController *end=segue.destinationViewController;
    end.name=name;
    end.score=scoreDisplay.text;
    getHighScore=[scoreDisplay.text floatValue];
}

-(CGFloat)getHighScore
{
    if(scoreOld>getHighScore)
    {
        scoreHigh=scoreOld;
    }
    else
    {
        scoreOld=getHighScore;
        scoreHigh=scoreOld;
    }
    return scoreHigh;
}

-(void)freshPage
{
    int total = arc4random_uniform(showNumBubble)+1;
    int deleteNum = arc4random_uniform((int)[a count]-1);
    if (total >= ((int)[a count]-1))
    {
        [self removeBubbles:deleteNum];
        int addNum = total - ((int)[a count]-1);
        [self addBubbleIntoArray:addNum];
    }
    else
    {
        int removeNum = ((int)[a count]-1) - total;
        [self removeBubbles:removeNum];
    }
}

- (void)removeBubbles:(int)num
{
    int i = 0;
     while (i < num){
        if(num<(int)[a count]-1)
        {
            [[a lastObject] removeFromSuperview];
            [a removeLastObject];
            i++;
        }
        else break;
    }
}

-(void)showTime:(int)time
{

    self.timeDisplay.text=[NSString stringWithFormat:@"%d", time];
    self.timer=[NSTimer scheduledTimerWithTimeInterval:1
                                                target:self
                                              selector:@selector(tick)
                                              userInfo:nil
                                               repeats:YES];
}

- (void)tick
{
    self.lefttime=[self.timeDisplay.text intValue];
    self.lefttime--;
    self.timeDisplay.text = [NSString stringWithFormat:@"%ld", self.lefttime];
    [self freshPage];
    if (self.lefttime <= 0)
    {
        [self.timer invalidate];
        self.timer = nil;
        [self performSegueWithIdentifier:@"endGame" sender:self];
        [self.view removeFromSuperview];
        score=0;
    }
}

- (void)addBubbleIntoArray:(int)num
{
    UIButton *nextBubble=[[UIButton alloc]init];
    nextBubble=[self settingBubble];
    [a addObject:nextBubble];
    int midi=0;
    while(midi<num)
    {
        int judgement=0;
        nextBubble = [self settingBubble];
        for(int i=0; i<[a count]; i++)
        {
            UIButton *oldBubble=[a objectAtIndex:i];
            if(CGRectIntersectsRect(nextBubble.frame, oldBubble.frame))
            {
                judgement=0;
                break;
            }
            judgement =1;
        }
        if(judgement==1)
        {
            [a addObject:nextBubble];
            midi=midi+1;
            [self.view addSubview:nextBubble];
            [nextBubble    addTarget:self
                              action:@selector(buttClick:)
                    forControlEvents:UIControlEventTouchUpInside];
        }
    }
}

-(void)buttClick:(id)sender
{
    UIButton *clickBubble=sender;
    if(clickBubble.tag== 1)
    {
        if(old.tag==clickBubble.tag){
            score=score+1*1.5;
            old=clickBubble;
            [clickBubble removeFromSuperview];
        }
        else
        {
            score=score+1;
            [clickBubble removeFromSuperview];
            old=clickBubble;
        }
    }
    if(clickBubble.tag==2)
    {
        if(old.tag==clickBubble.tag){
            score=score+2*1.5;
            old=clickBubble;
            [clickBubble removeFromSuperview];
        }
        else
        {
            score=score+2;
            [clickBubble removeFromSuperview];
            old=clickBubble;
        }
    }
    if(clickBubble.tag==3)
    {
        if(old.tag==clickBubble.tag){
            score=score+5*1.5;
            old=clickBubble;
            [clickBubble removeFromSuperview];
        }
        else
        {
            score=score+5;
            [clickBubble removeFromSuperview];
            old=clickBubble;
        }
    }
    if(clickBubble.tag==4)
    {
        if(old.tag==clickBubble.tag){
            score=score+8*1.5;
            old=clickBubble;
            [clickBubble removeFromSuperview];
        }
        else
        {
            score=score+8;
            [clickBubble removeFromSuperview];
            old=clickBubble;
        }

    }
    if(clickBubble.tag==5)
    {
        if(old.tag==clickBubble.tag){
            score=score+10*1.5;
            old=clickBubble;
            [clickBubble removeFromSuperview];
        }
        else
        {
            score=score+10;
            [clickBubble removeFromSuperview];
            old=clickBubble;
        }

    }
    self.scoreDisplay.text=[NSString stringWithFormat:@"%.1f", score];
}

-(UIButton *)settingBubble
{
    int color = arc4random_uniform(20);
    bubble=[[UIButton alloc]init];
    bubble.layer.borderColor=[self bubbleColor:color].CGColor;
    CGFloat width = arc4random_uniform(30)+50;
    CGFloat x = (CGFloat) (arc4random_uniform(self.view.frame.size.width-width));
    CGFloat y = (CGFloat) (arc4random_uniform(self.view.frame.size.height-width-35))+35;
    bubble.layer.cornerRadius=width*0.5;
    bubble.layer.borderWidth=4.0;
    bubble.frame=CGRectMake(x, y, width, width);
    return bubble;
}

-(UIColor *)bubbleColor:(int)color
{
    if (color < 8)
    {
        bubble.tag=1;
        return [UIColor redColor];
    }
    else if (7 < color && color < 14)
    {
        UIColor * pinkColor = [[UIColor alloc] initWithRed:1 green:0.42 blue:0.52 alpha:1];
        bubble.tag=2;
        return pinkColor;
    }
    else if (13 < color && color < 17)
    {
        bubble.tag=3;
        return [UIColor greenColor];
    }
    else if (16 < color && color < 19)
    {
        bubble.tag=4;
        return [UIColor blueColor];
    }
    else
    {
        bubble.tag=5;
        return [UIColor blackColor];
    }
}

@end
