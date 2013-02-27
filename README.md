StaticDataTableViewController 2.0
=============================

Enables to hide static cells

This class enables to hide/show static cells (created in IB, using the option Content : Static cells) for UITableView

##Usage

just subclass your UITableViewController

<pre>
// never call [self.tableView reloadData] directly
// doing so will lead to data inconsistenci
// always use this method for reload
- (void)reloadDataAnimated:(BOOL)animated;
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
[self updateCells:self.outletCollectionToMyStaticCells];
[self reloadDataAnimated:YES];
</pre>

you can use (updateCells:) to reload multiple cells


##Version History

Version 2.0.2
- Added support for variable heights on static rows

Version 2.0.1
- fixed critical bug

Version 2.0
- added full row animation support

Version 1.1
- added iOS5 back compatibility
- added support for IBOutletCollections and hidding multiple cells with an array of IBOutles

##Note
- Create outlets to UITableViews, not their content views!
- Don't call [self.tableView reloadData], ALWAYS use (reloadDataAnimated:)
- if you want to hide the whole section, just create a IBOutletCollection to all its cell, and then use [self cells:setHidden:] with (self.hideSectionsWithHiddenRows = YES)

##License
Apache License 2.0: http://www.apache.org/licenses/LICENSE-2.0.txt
