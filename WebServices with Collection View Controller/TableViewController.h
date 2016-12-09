//
//  TableViewController.h
//  WebServices with Collection View Controller
//
//  Created by Student-002 on 21/11/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController
@property (nonatomic, retain)NSMutableArray *name;
@property (nonatomic,retain)NSString *temp;
@property (nonatomic,retain)dispatch_queue_t queue;

@end
