StaticDataTableViewController 2.0
=============================

Enables to hide static cells

This class enables to hide/show static cells (created in IB, using the option Content : Static cells) for UITableView

Version 2.0.1
- fixed critical bug

Version 2.0
- added full row animation support

Version 1.1
- added iOS5 back compatibility
- added support for IBOutletCollections and hidding multiple cells with an array of IBOutles

Usage

just subclass your UITableViewController

<pre>@interface MyViewController : StaticDataTableViewController</pre>

than you can use methods

<pre>
@interface StaticDataTableViewController : UITableViewController

@property (nonatomic, assign) BOOL hideSectionsWithHiddenRows;


@property (nonatomic, assign) UITableViewRowAnimation insertTableViewRowAnimation;

@property (nonatomic, assign) UITableViewRowAnimation deleteTableViewRowAnimation;

@property (nonatomic, assign) UITableViewRowAnimation reloadTableViewRowAnimation;


- (BOOL)cellIsHidden:(UITableViewCell *)cell;

- (void)updateCell:(UITableViewCell *)cell;

- (void)updateCells:(NSArray *)cells;

- (void)cell:(UITableViewCell *)cell setHidden:(BOOL)hidden;

- (void)cells:(NSArray *)cells setHidden:(BOOL)hidden;

// never call [self.tableView reloadData] directly
// doing so will lead to data inconsistenci
// always use this method for reload
- (void)reloadDataAnimated:(BOOL)animated;

@end
</pre>

to hide/show specific cells, to which you have an outlet
<pre>
self.hideSectionsWithHiddenRows = YES; //YES, NO
[self cell:self.outletToMyStaticCell1 setHidden:hide];
[self cell:self.outletToMyStaticCell2 setHidden:hide];
[self reloadDataAnimated:YES];
</pre>

to hide/show cells in an outlet collection
<pre>
self.hideSectionsWithHiddenRows = YES; //YES, NO
[self cells:self.outletCollectionToMyStaticCells setHidden:hide];
[self reloadDataAnimated:YES];
</pre>

to reload cell in an outlet collection
<pre>
[self updateCell:self.outletCollectionToMyStaticCells];
[self reloadDataAnimated:YES];
</pre>

you can use (updateCells:) to reload multiple cells

Note
- Create outlets to UITableViews, not their content views!
- Don't call [self.tableView reloadData], ALWAYS use (reloadDataAnimated:)
- if you want to hide the whole section, just create a IBOutletCollection to all its cell, and then use [self cells:setHidden:] with (self.hideSectionsWithHiddenRows = YES)

