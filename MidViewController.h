//
//  MidViewController.h
//  Assignment_Shuai Li
//
//  Created by Shuai Li on 17/5/17.
//  Copyright © 2017 Shuai Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MidViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *showCount;
@property (assign, nonatomic) NSInteger newlefttime;
@property (strong, nonatomic) NSTimer *newtimer;

@end
