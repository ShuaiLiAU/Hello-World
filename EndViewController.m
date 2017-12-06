//
//  EndViewController.m
//  Assignment_Shuai Li
//
//  Created by Shuai Li on 16/5/17.
//  Copyright © 2017 Shuai Li. All rights reserved.
//

#import "EndViewController.h"
#import "StartViewController.h"
#import "ViewController.h"
@interface EndViewController ()

@end

@implementation EndViewController
NSMutableArray * scoreArray;
NSMutableArray * temArray;
NSMutableArray* nameArray;
NSMutableArray* scoreData;
NSString *highest;
int nameNum;
int roundNum=0;
@synthesize name;
@synthesize score;
@synthesize reStart;

- (void)viewDidLoad {
    [super viewDidLoad];
    roundNum++;
    _finalName=name;
    _finalScore=score;
    NSDictionary * passedRecord = @{
                                    @"name":self.finalName,
                                    @"score":self.finalScore
                                    };
    
    [self storeScoreData:passedRecord];
    roundNum++;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)storeScoreData:(NSDictionary*) dictionary{
    
    if(roundNum==1)
    {
        scoreData=[[NSMutableArray alloc]init];
        [scoreData addObject:dictionary];
        highest=score;
    }
    else
    {
        NSString *transScore=score;
        if(transScore.intValue >highest.intValue){
            highest = transScore;
            [scoreData addObject:dictionary];
        };
        
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [scoreData count];
}


- (IBAction)reStart:(id)sender {
    [self performSegueWithIdentifier:@"Start" sender:self];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = scoreData[indexPath.row][@"name"];
    cell.detailTextLabel.text = scoreData[indexPath.row][@"score"];
    return cell;
}

@end
