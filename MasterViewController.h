//
//  MasterViewController.h
//  Longevity
//
//  Created by Jesse Scott on 2014-03-05.
//  Copyright (c) 2014 ECUAD. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController  {

    NSArray *imagesArray;
}

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
