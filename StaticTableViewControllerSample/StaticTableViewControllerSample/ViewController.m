//
//  ViewController.m
//  StaticTableViewControllerSample
//
//  Created by Peter Paulis on 1.2.2013.
//  Copyright (c) 2013 Peter Paulis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.hideSectionsWithHiddenRows = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) toggleCellVissibility:(UITableViewCell *)cell {

    [self cell:cell setHidden:![self cellIsHidden:cell]];
    [self reloadDataAnimated];

}

- (IBAction)buttonCell11Pressed:(id)sender {
    [self toggleCellVissibility:self.cell11];
}

- (IBAction)buttonCell12Pressed:(id)sender {
    [self toggleCellVissibility:self.cell12];
}

- (IBAction)buttonCell13Pressed:(id)sender {
    [self toggleCellVissibility:self.cell13];
}

- (IBAction)buttonCell21Pressed:(id)sender {
    [self toggleCellVissibility:self.cell21];
}

- (IBAction)buttonCell22Pressed:(id)sender {
    [self toggleCellVissibility:self.cell22];
}

- (IBAction)buttonCell23Pressed:(id)sender {
    [self toggleCellVissibility:self.cell23];
}

@end
