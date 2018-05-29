<p align="center">
  **StaticDataTableViewController**
</p>

----------------

This class enables animated hide/show of static cells and sections (created in IB, using the option Content : Static cells) for UITableView

This method **doesn't use the hacky solution** with setting height to 0 and **allows you to animate** the change and hide  **whole sections**

## Features

- [x] Animations on cells and sections
- [x] Change height / Resize cells
- [x] Not using the hacky solution with height 0
- [x] Hide empty sections
- [x] Control section header, footer visibility for empty sections 

## Usage

Subclass your `UITableViewController` with the `StaticDataTableViewController`

```objective-c
#import "StaticDataTableViewController.h"

@interface DemoTableViewController : StaticDataTableViewController

@end
```

**Always use this method for table view reload** 

```objective-c
- (void)reloadDataAnimated:(BOOL)animated) 
```

don't call `[self.tableView reloadData]`

To hide/show specific cells, to which you have an outlet or an outlet collection

``` objective-c
[self cell:self.outletToMyStaticCell1 setHidden:YES];
[self cell:self.outletToMyStaticCell2 setHidden:NO];
[self cells:self.outletToManyCells setHidden:YES];
[self reloadDataAnimated:YES];
```
- if you want to hide the whole section, just create a IBOutletCollection to all its cell, and then use `[self cells:setHidden:]`

To change height of specific cells, to which you have an outlet or an outlet collection

``` objective-c
[self cell:self.outletToMyStaticCell1 setHeight:44];
[self cell:self.outletToMyStaticCell2 setHeight:44];
[self cells:self.outletToManyCells setHeight:200];
[self reloadDataAnimated:YES];
```

to customize animations, just set these properties to desired values

``` objective-c
self.insertTableViewRowAnimation = UITableViewRowAnimationRight;
self.deleteTableViewRowAnimation = UITableViewRowAnimationLeft;
self.reloadTableViewRowAnimation = UITableViewRowAnimationMiddle;
```

or call `reloadDataAnimated:insertAnimation:reloadAnimation:deleteAnimation:` with desired animation values

to control if the footer or header should be displayed, overwrite these methods in your subclass

``` objective-c
- (BOOL)showHeaderForSection:(NSInteger)section vissibleRows:(NSInteger)vissibleRows;
- (BOOL)showFooterForSection:(NSInteger)section vissibleRows:(NSInteger)vissibleRows;
```

## Installation with CocoaPods

To integrate StaticDataTableViewController into your Xcode project using CocoaPods, specify it in your `Podfile`:

```bash
  pod 'StaticDataTableViewController'
```

## Note
- Create outlets to UITableViewsCells, not their content views!
- Don't call [self.tableView reloadData], ALWAYS use (reloadDataAnimated:)


##License
Apache License 2.0: http://www.apache.org/licenses/LICENSE-2.0.txt

##Credits
min:60 - Building mobile solutions - <a href="https://min60.com">https://min60.com</a>
