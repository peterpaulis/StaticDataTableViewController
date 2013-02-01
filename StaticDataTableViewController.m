//
//  StaticTableViewController.m
//  WhatsInMyFood
//
//  Created by Peter Paulis on 31.1.2013.
//  Copyright (c) 2013 Peter Paulis. All rights reserved.
//

#import "StaticDataTableViewController.h"

// ------------------

@interface OriginalRow : NSObject

@property (nonatomic, assign) BOOL hidden;

@property (nonatomic, weak) UITableViewCell * cell;

@end

@implementation OriginalRow
@end

// ------------------

@interface OriginalSection : NSObject

@property (nonatomic, strong) NSString * label;

@property (nonatomic, strong) NSMutableArray * rows;

@end

@implementation OriginalSection

- (int) numberOfVissibleRows {
    int count = 0;
    for (OriginalRow * or in self.rows) {
        if (!or.hidden) {
            ++count;
        }
    }
    
    return count;
}

- (int) vissibleRowIndexWithTableViewCell:(UITableViewCell *)cell {
    
    int i  = 0;
    for (OriginalRow * or in self.rows) {
        
        if (or.cell == cell) {
            return i;
        }
        
        if (!or.hidden) {
            ++i;
        }
    }
    
    return -1;
}

@end

// ------------------

@interface OriginalTable : NSObject

@property (nonatomic, strong) NSMutableArray * sections;

@property (nonatomic, weak) UITableView * tableView;

@end

@implementation OriginalTable

- (id) initWithTableView:(UITableView *) tableView {
    
    self = [super init];
    if (self) {
        
        int numberOfSections = [tableView numberOfSections];
        self.sections = [[NSMutableArray alloc] initWithCapacity:numberOfSections];
        
        for (int i = 0; i < numberOfSections; ++i) {
            OriginalSection * originalSection = [OriginalSection new];
            
            int numberOfRows = [tableView numberOfRowsInSection:i];
            originalSection.rows = [[NSMutableArray alloc] initWithCapacity:numberOfRows];
            for (int ii = 0; ii < numberOfRows; ++ii) {
                OriginalRow * tableViewRow = [OriginalRow new];
                
                NSIndexPath * ip = [NSIndexPath indexPathForItem:ii inSection:i];
                tableViewRow.cell = [tableView cellForRowAtIndexPath:ip];
                
                originalSection.rows[ii] = tableViewRow;
            }
            
            self.sections[i] = originalSection;
        }
        
        self.tableView = tableView;
    }
    
    return self;
}

- (OriginalRow *) originalRowWithIndexPath:(NSIndexPath *)indexPath {
    
    OriginalSection * oSection = self.sections[indexPath.section];
    OriginalRow * oRow = oSection.rows[indexPath.row];
    
    return oRow;
}

- (OriginalRow *) vissibleOriginalRowWithIndexPath:(NSIndexPath *)indexPath {
    
    OriginalSection * oSection = self.sections[indexPath.section];
    int vissibleIndex = -1;
    for (int i = 0; i < [oSection.rows count]; ++i) {
        
        OriginalRow * oRow = [oSection.rows objectAtIndex:i];
        
        if (!oRow.hidden) {
            ++vissibleIndex;
        }
        
        if (indexPath.row == vissibleIndex) {
            return oRow;
        }
        
    }
    
    return nil;
}

- (OriginalRow *) originalRowWithTableViewCell:(UITableViewCell *)cell {
    
    for (int i = 0; i < [self.sections count]; ++i) {
    
        OriginalSection * os = self.sections[i];
    
        for (int ii = 0; ii < [os.rows count]; ++ii) {
            
            if ([os.rows[ii] cell] == cell) {
                return os.rows[ii];
            }
            
        }
        
    }
    
    return nil;
}



@end

// ------------------

@interface StaticDataTableViewController ()

@property (nonatomic, strong) OriginalTable * originalTable;

@end

@implementation StaticDataTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.originalTable = [[OriginalTable alloc] initWithTableView:self.tableView];
    
}

- (void) cell:(UITableViewCell *)cell setHidden:(BOOL)hidden {
    [[self.originalTable originalRowWithTableViewCell:cell] setHidden:hidden];
}

- (BOOL) cellIsHidden:(UITableViewCell *)cell {
    return [[self.originalTable originalRowWithTableViewCell:cell] hidden];
}

- (void) reloadDataAnimated {
    
    [self.tableView reloadData];
    
    NSIndexSet * reloadSet = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, [self numberOfSectionsInTableView:self.tableView])];
    
    [self.tableView reloadSections:reloadSet withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView reloadData];

}

#pragma Mark - TableView Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.originalTable == nil) {
        return [super tableView:tableView numberOfRowsInSection:section];
    }
    
    return [self.originalTable.sections[section] numberOfVissibleRows];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.originalTable == nil) {
        return [super tableView:tableView cellForRowAtIndexPath:indexPath];
    }
    
    OriginalRow * or = [self.originalTable vissibleOriginalRowWithIndexPath:indexPath];
    
    return or.cell;
}


@end
