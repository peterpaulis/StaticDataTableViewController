//
//  StaticTableViewController.h
//  WhatsInMyFood
//
//  Created by Peter Paulis on 31.1.2013.
//  Copyright (c) 2013 Peter Paulis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StaticDataTableViewController : UITableViewController

- (void) cell:(UITableViewCell *)cell setHidden:(BOOL)hidden;

- (void) reloadDataAnimated;

@end
