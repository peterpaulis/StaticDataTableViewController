//
//  ViewController.h
//  StaticTableViewControllerSample
//
//  Created by Peter Paulis on 1.2.2013.
//  Copyright (c) 2013 Peter Paulis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StaticDataTableViewController.h"

@interface ViewController : StaticDataTableViewController
@property (weak, nonatomic) IBOutlet UITableViewCell *cell11;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell12;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell13;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell21;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell22;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell23;
- (IBAction)buttonCell11Pressed:(id)sender;
- (IBAction)buttonCell12Pressed:(id)sender;
- (IBAction)buttonCell13Pressed:(id)sender;
- (IBAction)buttonCell21Pressed:(id)sender;
- (IBAction)buttonCell22Pressed:(id)sender;
- (IBAction)buttonCell23Pressed:(id)sender;
- (IBAction)buttonCellC12C22Pressed:(id)sender;
- (IBAction)buttonSectionPressed:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *switchReloadOnlyDontToggleVissibility;
@property (weak, nonatomic) IBOutlet UISwitch *switchAnimated;

@property (strong, nonatomic) IBOutletCollection(UITableViewCell) NSArray *section2Cells;

@property (strong, nonatomic) IBOutletCollection(UITableViewCell) NSArray *cells12_22;

@end
