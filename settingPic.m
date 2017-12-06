//
//  NYBubble.m
//  Bubble
//
//  Created by apple on 16/5/9.
//  Copyright © 2016年 Neil. All rights reserved.
//

#import "settingPic.h"

@implementation settingPic


- (id)initBubblesToArray:(NSMutableArray *)bubbleArray
{
    if (self = [super init]) {
        int pos = arc4random_uniform(20);
        //0-7
        if (pos < 8) {
            self.tag = NYBubbleColorRed;
            [self setBubbleFrameColored:@"red" ToArray:bubbleArray];
            return self;
        }
        //8-13
        if (7 < pos && pos < 14) {
            self.tag = NYBubbleColorPink;
            [self setBubbleFrameColored:@"pink" ToArray:bubbleArray];
            return self;
        }
        //13-16
        if (13 < pos && pos < 17) {
            self.tag = NYBubbleColorGreen;
            [self setBubbleFrameColored:@"green" ToArray:bubbleArray];
            return self;
        }
        //16-19
        if (16 < pos && pos < 19) {
            self.tag = NYBubbleColorBlue;
            [self setBubbleFrameColored:@"blue" ToArray:bubbleArray];
            return self;
        }
        //19
        if (pos == 19) {
            self.tag = NYBubbleColorBlack;
            [self setBubbleFrameColored:@"black" ToArray:bubbleArray];
            return self;
        }
    }
    return self;
}

- (void)setBubbleFrameColored:(NSString *)color ToArray:(NSMutableArray *)bubbleArray
{
    while (1) {
        bubble=[[UIButton alloc]init];
        
        bubble.layer.cornerRadius=50;
        bubble.layer.borderWidth=0.0;
        //[self bubblePic:@"04"];
        
        CGFloat x = (CGFloat) (arc4random_uniform(self.view.frame.size.width-100));
        CGFloat y = (CGFloat) (arc4random_uniform(self.view.frame.size.height-100));
        
        bubble.frame=  CGRectMake(x, y, 100, 100);
        //bubble.layer.borderColor=[UIColor purpleColor].CGColor;
        [bubble setBackgroundImage:[UIImage imageNamed:@"03.png"] forState:UIControlStateNormal];
        if ([bubbleArray count]!=0) {
            //examine whether the new rect overlaps the old bubbles
            for (int k = 0; k < [bubbleArray count] ; k++) {
                UIButton *oldBubble = [bubbleArray objectAtIndex:k];
                if (CGRectIntersectsRect(newBRect, oldBubble.frame)) {
                    bubbleIntersected = YES;
                    break;
                }
            }
        }
        
        //new rect doesn't overlap old bubbles
        if (bubbleIntersected == NO) {
            self.frame = newBRect;
            [self setImage:[UIImage imageNamed:color] forState:UIControlStateNormal];
            self.imageView.contentMode = UIViewContentModeScaleAspectFit;
            return;
        }
        
        //new rect overlap old bubbles
        else{
            continue;
        }
    }
}
@end
