//
//  EndViewController.h
//  Assignment_Shuai Li
//
//  Created by Shuai Li on 16/5/17.
//  Copyright © 2017 Shuai Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EndViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *reStart;
@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) NSString* score;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong,nonatomic) NSString *finalName;
@property (strong,nonatomic) NSString *finalScore;
@property (weak, nonatomic) IBOutlet UITableView *newtableview;

- (IBAction)reStart:(id)sender;

@end
