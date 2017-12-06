//
//  ViewController.h
//  Assignment_Shuai Li
//
//  Created by Shuai Li on 13/5/17.
//  Copyright © 2017 Shuai Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *displayHighScore;
@property (weak, nonatomic) IBOutlet UILabel *scoreDisplay;
@property (weak, nonatomic) IBOutlet UILabel *timeDisplay;
@property (strong, nonatomic) NSTimer* timer;
@property (assign, nonatomic) NSInteger lefttime;
@property (strong, nonatomic) NSString* midNum;
@property (strong, nonatomic) NSString *name;
@property (assign, nonatomic) int showNumBubble;
@property (assign, nonatomic) int showtime;

@end

