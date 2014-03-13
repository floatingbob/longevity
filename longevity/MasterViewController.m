//
//  MasterViewController.m
//  Longevity
//
//  Created by Jesse Scott on 2014-03-05.
//  Copyright (c) 2014 ECUAD. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"



@implementation MasterViewController

- (void)awakeFromNib
{
    self.clearsSelectionOnViewWillAppear = NO;
    self.preferredContentSize = CGSizeMake(225.0, 100.0); // EDIT THIS - 225.0
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    imagesArray = [NSArray arrayWithObjects:
                   [UIImage imageNamed:@"ViewDashboard"],
                   [UIImage imageNamed:@"TodaysExercises_Selected"],
                   [UIImage imageNamed:@"AboutCondition"],
                   [UIImage imageNamed:@"ViewProgress"],
                   [UIImage imageNamed:@"MyCommunity"],
                   [UIImage imageNamed:@"PercentCompleted"],
                   nil];
    
    
    self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Table View

/*
 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
    //return [imagesArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];


    UIImageView *av;
    if(indexPath.row < [imagesArray count]) {
        av = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 225, 100)];
    }
    else if(indexPath.row == [imagesArray count]) {
        av = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 225, 200)]; // FIX SIZE OF LAST CELL
    }
    av.image = [imagesArray objectAtIndex:indexPath.row];
    cell.backgroundView = av;
    cell.imageView.image = av.image; // FIX SELECTED IMAGE

    
    return cell;
}
*/

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

// WHAT HAPPENS WHEN WE CLICK A PARTICULAR CELL
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    UIStoryboard*  sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    switch (indexPath.row) {
        case 0:
            NSLog(@"Loading 1");
            self.detailViewController = [sb instantiateViewControllerWithIdentifier:@"DetailViewController1"];
            break;
        case 1:
            NSLog(@"Loading 2");
            self.detailViewController = [sb instantiateViewControllerWithIdentifier:@"DetailViewController2"];
            break;
        case 2:
            NSLog(@"Loading 3");
            self.detailViewController = [sb instantiateViewControllerWithIdentifier:@"DetailViewController3"];
            break;
        case 3:
            NSLog(@"Loading 4");
            self.detailViewController = [sb instantiateViewControllerWithIdentifier:@"DetailViewController3"];
            break;
        case 4:
            NSLog(@"Loading 5");
            self.detailViewController = [sb instantiateViewControllerWithIdentifier:@"DetailViewController5"];
            break;
        default:
            break;
    }
    
    [self.navigationController pushViewController:self.detailViewController animated:YES];
    
}

@end
