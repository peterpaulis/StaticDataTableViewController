StaticDataTableViewController 2.0
=============================

This class enables animated hide/show of static cells (created in IB, using the option Content : Static cells) for UITableView

##Usage

- add StaticDataTableViewController.h / .m to your project
- just subclass your UITableViewController with the StaticDataTableViewController
- always use this method for table view reload (- (void)reloadDataAnimated:(BOOL)animated) don't call [self.tableView reloadData]

to hide/show specific cells, to which you have an outlet
``` objective-c
self.hideSectionsWithHiddenRows = YES; //YES, NO
[self cell:self.outletToMyStaticCell1 setHidden:hide];
[self cell:self.outletToMyStaticCell2 setHidden:hide];
[self reloadDataAnimated:YES];
```

to hide/show cells in an outlet collection
``` objective-c
self.hideSectionsWithHiddenRows = YES; //YES, NO
[self cells:self.outletCollectionToMyStaticCells setHidden:hide];
[self reloadDataAnimated:YES];
```

to reload cell in an outlet collection
``` objective-c
[self updateCells:self.outletCollectionToMyStaticCells];
[self reloadDataAnimated:YES];
```

to customize animations, just set these properties to desired values
``` objective-c
self.insertTableViewRowAnimation = UITableViewRowAnimationRight;
self.deleteTableViewRowAnimation = UITableViewRowAnimationLeft;
self.reloadTableViewRowAnimation = UITableViewRowAnimationMiddle;
```

##Version History

Version 2.0.4
- added section headers animation support

Version 2.0.3
- semantic version tagging

Version 2.0.2.1
- Added support for Cocoa pods 

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
- Create outlets to UITableViewsCells, not their content views!
- Don't call [self.tableView reloadData], ALWAYS use (reloadDataAnimated:)
- if you want to hide the whole section, just create a IBOutletCollection to all its cell, and then use [self cells:setHidden:] with (self.hideSectionsWithHiddenRows = YES)

##License
Apache License 2.0: http://www.apache.org/licenses/LICENSE-2.0.txt

##Credits
min:60 - Building perfect apps, for affordable price - <a href="https://min60.com">https://min60.com</a>
