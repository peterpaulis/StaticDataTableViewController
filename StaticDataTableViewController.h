//
//  StaticTableViewController.h
//  WhatsInMyFood
//
//  Created by Peter Paulis on 31.1.2013.
//  Copyright (c) 2013 Peter Paulis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaticDataTableViewController : UITableViewController

@property (nonatomic, assign) BOOL hideSectionsWithHiddenRows;

- (BOOL) cellIsHidden:(UITableViewCell *)cell;

- (void) cell:(UITableViewCell *)cell setHidden:(BOOL)hidden;

- (void) cells:(NSArray *)cells setHidden:(BOOL)hidden;

- (void) reloadDataAnimated;

@end
