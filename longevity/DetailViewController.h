//
//  DetailViewController.h
//  Longevity
//
//  Created by Jesse Scott on 2014-03-05.
//  Copyright (c) 2014 ECUAD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate, UITableViewDelegate, UITableViewDataSource> {
    
    
    NSArray *CardioArray;
    NSArray *BalanceArray;
    NSArray *StrengthArray;
}

@property (strong, nonatomic)   id detailItem;
@property (weak, nonatomic)     IBOutlet UITableView *tableView1;
@property (weak, nonatomic)     IBOutlet UITableView *tableView2;
@property (weak, nonatomic)     IBOutlet UITableView *tableView3;
@property (weak, nonatomic)     IBOutlet UILabel *detailDescriptionLabel;

@end
