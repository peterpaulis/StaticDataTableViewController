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

- (void) toggleCellVissibilityOrReload:(UITableViewCell *)cell {

    if ([self.switchReloadOnlyDontToggleVissibility isOn]) {
        [self updateCell:cell];
    } else {
        [self cell:cell setHidden:![self cellIsHidden:cell]];
    }
    
    [self reloadDataAnimated:([self.switchAnimated isOn])];
}

- (IBAction)buttonCell11Pressed:(id)sender {
    [self toggleCellVissibilityOrReload:self.cell11];
}

- (IBAction)buttonCell12Pressed:(id)sender {
    [self toggleCellVissibilityOrReload:self.cell12];
}

- (IBAction)buttonCell13Pressed:(id)sender {
    [self toggleCellVissibilityOrReload:self.cell13];
}

- (IBAction)buttonCell21Pressed:(id)sender {
    [self toggleCellVissibilityOrReload:self.cell21];
}

- (IBAction)buttonCell22Pressed:(id)sender {
    [self toggleCellVissibilityOrReload:self.cell22];
}

- (IBAction)buttonCell23Pressed:(id)sender {
    [self toggleCellVissibilityOrReload:self.cell23];
}

- (IBAction)buttonCellC12C22Pressed:(id)sender {
    
    if ([self.switchReloadOnlyDontToggleVissibility isOn]) {
    
        [self updateCells:self.cells12_22];
        
    } else {
    
        BOOL hide = ([sender tag] == 0);
        [self cells:self.cells12_22 setHidden:hide];
        
    }
    
    [self reloadDataAnimated:([self.switchAnimated isOn])];
}

- (IBAction)buttonSectionPressed:(id)sender {
    
    if ([self.switchReloadOnlyDontToggleVissibility isOn]) {
    
        [self updateCells:self.section2Cells];
        
    } else {
    
        BOOL hide = ([sender tag] == 0);
        [self cells:self.section2Cells setHidden:hide];
        
    }
    
    [self reloadDataAnimated:([self.switchAnimated isOn])];
}

@end
