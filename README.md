StaticDataTableViewController
=============================

Enables to hide static cells

This class enables to hide/show static cells (created in IB, using the option Content : Static cells) for UITableView

Usage

just subclass your UITableViewController

<pre>@interface MyViewController : StaticDataTableViewController</pre>

than you can use methods

<pre>
@interface StaticDataTableViewController : UITableViewController

@property (nonatomic, assign) BOOL hideSectionsWithHiddenRows;

- (BOOL)cellIsHidden:(UITableViewCell *)cell;

- (void)cell:(UITableViewCell *)cell setHidden:(BOOL)hidden;

- (void)cells:(NSArray *)cells setHidden:(BOOL)hidden;

- (void)reloadDataAnimated;

@end
</pre>

to hide/show specific cells, to which you have an outlet
<pre>
self.hideSectionsWithHiddenRows = YES; //YES, NO
[self cell:self.outletToMyStaticCell1 setHidden:hide];
[self cell:self.outletToMyStaticCell2 setHidden:hide];
[self reloadDataAnimated];
</pre>

to hide/show cells in an outlet collection
<pre>
self.hideSectionsWithHiddenRows = YES; //YES, NO
[self cells:self.outletCollectionToMyStaticCells setHidden:hide];
[self reloadDataAnimated];
</pre>

Note
- create outlets to UITableViews, not their content views!
- if you want to hide the whole section, just create a IBOutletCollection to all its cell, and then use [self cells:setHidden:] with (self.hideSectionsWithHiddenRows = YES)

Version 1.1
- added iOS5 back compatibility
- added support for IBOutletCollections and hidding multiple cells with an array of IBOutles
