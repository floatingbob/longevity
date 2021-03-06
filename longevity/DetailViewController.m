//
//  DetailViewController.m
//  Longevity
//
//  Created by Jesse Scott on 2014-03-05.
//  Copyright (c) 2014 ECUAD. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation DetailViewController

// Synthesize
@synthesize tableView1,tableView2,tableView3;

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.masterPopoverController != nil) {
        [self.masterPopoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        // THIS IS THE CORE
        self.detailDescriptionLabel.text = [self.detailItem description];
        
        if ([self.detailDescriptionLabel.text isEqualToString:@"0"]) {
            NSLog(@"LOAD 0");
        }
        if ([self.detailDescriptionLabel.text isEqualToString:@"1"]) {
            NSLog(@"LOAD 1");
        }
        if ([self.detailDescriptionLabel.text isEqualToString:@"2"]) {
            NSLog(@"LOAD 2");
        }
        if ([self.detailDescriptionLabel.text isEqualToString:@"3"]) {
            NSLog(@"LOAD 3");
        }
        if ([self.detailDescriptionLabel.text isEqualToString:@"4"]) {
            NSLog(@"LOAD 4");
        }
 
        
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    BalanceArray = [NSArray arrayWithObjects:
                     [UIImage imageNamed:@"sidewaysStepping"],
                     [UIImage imageNamed:@"sitToStand"],
                     [UIImage imageNamed:@"tandemWalking"],
                     [UIImage imageNamed:@"reachingWhileStanding"],
                     [UIImage imageNamed:@"toeReachSeated"],
                     [UIImage imageNamed:@"tiptoeChair"],
                     [UIImage imageNamed:@"custom"],
                     nil];
    StrengthArray = [NSArray arrayWithObjects:
                     [UIImage imageNamed:@"strength_1"],
                     [UIImage imageNamed:@"strength_2"],
                     [UIImage imageNamed:@"strength_3"],
                     [UIImage imageNamed:@"strength_4"],
                     [UIImage imageNamed:@"strength_5"],
                     [UIImage imageNamed:@"strength_6"],
                     [UIImage imageNamed:@"custom"],
                     nil];
    CardioArray = [NSArray arrayWithObjects:
                     [UIImage imageNamed:@"cardio_1"],
                     [UIImage imageNamed:@"cardio_2"],
                     [UIImage imageNamed:@"cardio_3"],
                     [UIImage imageNamed:@"cardio_4"],
                     [UIImage imageNamed:@"cardio_5"],
                     [UIImage imageNamed:@"cardio_6"],
                     [UIImage imageNamed:@"custom"],
                     nil];
    ExerciseDetailArray = [NSArray arrayWithObjects:
                   [UIImage imageNamed:@"cardio_1"],
//                   [UIImage imageNamed:@"cardio_2"],
//                   [UIImage imageNamed:@"cardio_3"],
//                   [UIImage imageNamed:@"cardio_4"],
//                   [UIImage imageNamed:@"cardio_5"],
//                   [UIImage imageNamed:@"cardio_6"],
//                   [UIImage imageNamed:@"custom"],
                   nil];
    
    [self configureView];
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [BalanceArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    if (tableView == tableView1) {
        cell = [self.tableView1 dequeueReusableCellWithIdentifier:@"cardio"];
        UIImageView *av = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 192, 73)];
        av.image = [CardioArray objectAtIndex:indexPath.row];
        cell.backgroundView = av;
    }
    else if(tableView == tableView2) {
        cell = [self.tableView2 dequeueReusableCellWithIdentifier:@"balance"];
        UIImageView *av = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 192, 73)];
        av.image = [BalanceArray objectAtIndex:indexPath.row];
        cell.backgroundView = av;
        
    }
    else if(tableView == tableView3) {
        cell = [self.tableView3 dequeueReusableCellWithIdentifier:@"strength"];
        UIImageView *av = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 192, 73)];
        av.image = [StrengthArray objectAtIndex:indexPath.row];
        cell.backgroundView = av;
    }
    
    return cell;
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
