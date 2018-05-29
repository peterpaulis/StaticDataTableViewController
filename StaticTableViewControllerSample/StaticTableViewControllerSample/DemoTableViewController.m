//
//  DemoTableViewController.m
//  StaticTableViewControllerSample
//
//  Created by Peter Paulis on 24/05/2018.
//  Copyright © 2018 Peter Paulis. All rights reserved.
//

#import "DemoTableViewController.h"

@interface DemoTableViewController ()

@property (weak, nonatomic) IBOutlet UITableViewCell *cell1;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell3;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell4;
@property (weak, nonatomic) IBOutlet UITableViewCell *cell9;

@property (weak, nonatomic) IBOutlet UIButton *cell2Button;
@property (weak, nonatomic) IBOutlet UIButton *cell3Button;
@property (weak, nonatomic) IBOutlet UIButton *cell6Button;

@property (weak, nonatomic) IBOutlet UITableViewCell *animationSettingsCells;

@property (weak, nonatomic) IBOutlet UISegmentedControl *insertAnimationsSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *deleteAnimationsSegmentedControl;
@property (weak, nonatomic) IBOutlet UISegmentedControl *reloadAnimationsSegmentedControl;
@property (weak, nonatomic) IBOutlet UISwitch *animationsSwitch;
@property (strong, nonatomic) IBOutlet UIView *animationsCustomHeaderView;

@property (strong, nonatomic) IBOutletCollection(UITableViewCell) NSArray *section2Cells;


@end

@implementation DemoTableViewController

- (IBAction)cell1ButtonPressed:(id)sender {
    
    [self cell:self.cell1 setHidden:YES];
    
    [self reloadDataAnimated:self.animationsSwitch.isOn];
    
}

- (IBAction)cell2ButtonPressed:(id)sender {

    BOOL isHidden = [self isCellHidden:self.cell1];
    [self cell:self.cell1 setHidden:!isHidden];

    [self reloadDataAnimated:self.animationsSwitch.isOn];
    
}

- (IBAction)cell3ButtonPressed:(id)sender {

    BOOL isHidden = [self isCellHidden:self.cell3];
    [self cell:self.cell3 setHidden:!isHidden];
    [self cell:self.cell4 setHidden:!isHidden];
    
    [self reloadDataAnimated:self.animationsSwitch.isOn];
    
    [self.cell3Button setTitle:isHidden?@"Hide cells 4 and 5":@"Show cells 4 and 5" forState:UIControlStateNormal];
    
}

- (IBAction)cell6ButtonPresssed:(id)sender {
   
    BOOL isHidden = [self isCellHidden:[self.section2Cells firstObject]];
    [self cells:self.section2Cells setHidden:!isHidden];
    
    [self reloadDataAnimated:self.animationsSwitch.isOn];
    
    [self.cell6Button setTitle:isHidden?@"Hide section 2":@"Show section 2" forState:UIControlStateNormal];
    
}

- (IBAction)insertAnimationsSegmentedControlChanged:(UISegmentedControl *)sender {

    self.insertTableViewRowAnimation = [self animationWithSegmentIndex:sender.selectedSegmentIndex];
    
}

- (IBAction)deleteAnimationsSegmentedControlChanged:(UISegmentedControl *)sender {

    self.deleteTableViewRowAnimation = [self animationWithSegmentIndex:sender.selectedSegmentIndex];
    
}

- (IBAction)reloadAnimationsSegmentedControlChanged:(UISegmentedControl *)sender {

    self.reloadTableViewRowAnimation = [self animationWithSegmentIndex:sender.selectedSegmentIndex];
    
}

- (IBAction)animationSwitchChanged:(UISwitch *)sender {

    [self cell:self.animationSettingsCells setHidden:!sender.isOn];
    [self reloadDataAnimated:YES];
    
}

- (IBAction)cell7ButtonPressed:(id)sender {

    CGFloat h = self.cell9.bounds.size.height;
    [self cell:self.cell9 setHeight:h + 32];
    [self reloadDataAnimated:self.animationsSwitch.isOn];
    
}

- (IBAction)cell8ButtonPressed:(id)sender {

    CGFloat h = self.cell9.bounds.size.height;
    [self cell:self.cell9 setHeight:MAX(0, h - 32)];
    [self reloadDataAnimated:self.animationsSwitch.isOn];
    
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Private
////////////////////////////////////////////////////////////////////////

- (UITableViewRowAnimation)animationWithSegmentIndex:(NSUInteger)index {
    
    NSArray * animations = @[
                            @(UITableViewRowAnimationAutomatic),
                            @(UITableViewRowAnimationFade),
                            @(UITableViewRowAnimationRight),
                            @(UITableViewRowAnimationLeft),
                            @(UITableViewRowAnimationTop),
                            @(UITableViewRowAnimationBottom),
                            @(UITableViewRowAnimationMiddle)
                            ];
    
    return (UITableViewRowAnimation)[animations[index] integerValue];
    
}

////////////////////////////////////////////////////////////////////////
#pragma mark - Overwrited
////////////////////////////////////////////////////////////////////////

- (void)cell:(UITableViewCell *)cell setHidden:(BOOL)hidden {
    
    [super cell:cell setHidden:hidden];
    
    if (cell == self.cell1) {
        [self.cell2Button setTitle:hidden?@"Show cell 1":@"Hide cell 1" forState:UIControlStateNormal];
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return self.animationsCustomHeaderView;
    }
    return [super tableView:tableView viewForHeaderInSection:section];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 2) {
        return self.animationsCustomHeaderView.bounds.size.height;
    }
    return [super tableView:tableView heightForHeaderInSection:section];
}

@end
